package middlewares

import (
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/handlers/users"
	"net/http"
)

func AuthJWTMiddleWare(c *gin.Context) {

	token, err := c.Request.Cookie("access-token")
	if err != nil {
		c.JSON(http.StatusUnauthorized, err.Error())
		c.Abort()
		return
	}

	tknStr := token.Value
	if tknStr == "" {
		c.JSON(http.StatusUnauthorized, err.Error())
		c.Abort()
		return
	}

	claims := &users.Claims{}

	_, err = jwt.ParseWithClaims(tknStr, claims, func(token *jwt.Token) (interface{}, error) {
		return users.SECRET_KEY, nil
	})

	//TODO: expired token 검증

	c.Set("claims", claims)

	if err != nil {
		if err == jwt.ErrSignatureInvalid {
			//TODO: refresh token
			c.JSON(http.StatusUnauthorized, gin.H{
				"err": "token has been expired",
			})
			c.Abort()
			return
		}
		c.JSON(http.StatusUnauthorized, err.Error())
		c.Abort()
		return
	} else{
		c.Next()
	}

}