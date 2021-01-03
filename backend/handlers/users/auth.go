package users

import (
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"github.com/gofrs/uuid"
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"golang.org/x/crypto/bcrypt"
	"log"
	"net/http"
	"time"
)


var SECRET_KEY = []byte("secret key")

type Claims struct {
	UserId uint
	jwt.StandardClaims
}

func getHash(pwd []byte) string {
	hash, err := bcrypt.GenerateFromPassword(pwd, bcrypt.MinCost)
	if err != nil {
		log.Println(err)
	}
	return string(hash)
}

func GenerateJWTToken(user *models.User) (string,error) {

	expirationTime := time.Now().Add(time.Hour * 24 * 7)

	// User ID값 토큰에 추가
	claims := &Claims{
		UserId: user.ID,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt: expirationTime.Unix(),
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)

	tokenString, err := token.SignedString(SECRET_KEY)
	if err != nil{

		return "", err
	}
	return tokenString, nil
}

func SignupHandler (c *gin.Context) {

	// upload data to storage
	//middlewares.UploadGCSMiddleWare(c)

	var body models.User
	//db.DataBase.AutoMigrate(&models.User{})

	if err := c.ShouldBind(&body); err != nil {
		c.JSON(http.StatusInternalServerError, err.Error())
	}

	gen := uuid.NewGen()
	refreshToken, err := gen.NewV4()
	if err != nil {
		c.JSON(http.StatusInternalServerError, err.Error())
	}

	body.Password = getHash([]byte(body.Password))

	body.RefreshToken = refreshToken.String()

	if r := db.DataBase.Create(&body); r.Error != nil {
		c.String(http.StatusConflict, r.Error.Error())
	}

	c.JSON(http.StatusOK, gin.H{
		"userID": body.ID,
	})

}

func LoginHandler(c *gin.Context) {
	var user models.User
	var dbUser models.User

	if err := c.ShouldBind(&user); err != nil {
		panic(err)
	}

	db.DataBase.Where("email = ?", user.Email).First(&dbUser)

	userPass := []byte(user.Password)
	dbPass := []byte(dbUser.Password)

	passErr := bcrypt.CompareHashAndPassword(dbPass, userPass)

	if passErr != nil {
		c.JSON(http.StatusInternalServerError, passErr.Error())
	}

	jwtToken, err := GenerateJWTToken(&dbUser)

	if err != nil {
		panic(err)
	}

	c.Header("Last-Modified", time.Now().String())
	c.Header("Expires", "-1")

	c.JSON(http.StatusOK, gin.H{
		"isOK":"1",
		"access-token": jwtToken,
		"refresh-token": dbUser.RefreshToken,
	})
}

func RefreshHandler(c *gin.Context) {
	refreshToken := c.Request.Header.Get("refresh-token")
	accessToken := c.Request.Header.Get("access-token")

	tknStr := accessToken

	claims := &Claims{}

	jwt.ParseWithClaims(tknStr, claims, func(token *jwt.Token) (interface{}, error) {
		return SECRET_KEY, nil
	})

	var user models.User
	if r := db.DataBase.First(&user, claims.UserId); r.Error != nil {
		panic(r.Error)
	}

	if user.RefreshToken != refreshToken {
		c.JSON(http.StatusUnauthorized, gin.H{
			"isOK": "0",
		})
	} else {
		jwtToken, err := GenerateJWTToken(&user)

		if err != nil {
			panic(err)
		}

		c.JSON(http.StatusOK, gin.H{
			"isOK":         "1",
			"access-token": jwtToken,
		})
	}
}

func LogoutHandler(c *gin.Context) {

}