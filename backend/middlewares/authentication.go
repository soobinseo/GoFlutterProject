package middlewares

import (
	"github.com/dgrijalva/jwt-go"
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/handlers/users"
	"net/http"
)

func AuthJWTMiddleWare(c *gin.Context) {

	token := c.Request.Header.Get("access-token")
	tknStr := token

	if tknStr == "" {
		c.JSON(http.StatusUnauthorized, "")
		c.Abort()
		return
	}

	claims := &users.Claims{}

	_, err := jwt.ParseWithClaims(tknStr, claims, func(token *jwt.Token) (interface{}, error) {
		return users.SECRET_KEY, nil
	})

	// expiration 자동 검증
	if err != nil {
		c.JSON(419, err.Error())
		c.Abort()
		return
	} else {
		c.Set("userId", claims.UserId)
		c.Next()
	}

}