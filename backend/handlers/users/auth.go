package users

import (
	"fmt"
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
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

var expirationTime = 5 * time.Minute

func getHash(pwd []byte) string {
	hash, err := bcrypt.GenerateFromPassword(pwd, bcrypt.MinCost)
	if err != nil {
		log.Println(err)
	}
	return string(hash)
}

func GenerateJWT(user *models.User) (string,error) {

	expirationTime := time.Now().Add(expirationTime)

	// User ID값 토큰에 추가
	claims := &Claims{
		UserId: user.ID,
		StandardClaims: jwt.StandardClaims{
			ExpiresAt:expirationTime.Unix(),
		},
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	fmt.Println(token)

	tokenString, err := token.SignedString(SECRET_KEY)
	if err != nil{
		log.Println("Error in JWT token generation")
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
		panic(err)
	}

	body.Password = getHash([]byte(body.Password))

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
		panic(passErr)
	}

	jwtToken, err := GenerateJWT(&dbUser)
	if err != nil {
		panic(err)
	}

	c.Header("Last-Modified", time.Now().String())
	c.Header("Expires", "-1")
	c.SetCookie("access-token", jwtToken, 1800, "", "", false, false)
	c.JSON(http.StatusOK, gin.H{
		"isOK":"1",
	})
}