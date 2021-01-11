package users

import (
	"fmt"
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"net/http"
)

func GetUserDetailHandler(c *gin.Context) {
	_userId, _ := c.Get("userId")
	userId := _userId.(uint)

	user := models.UserDetail{UserID: userId}
	if err := db.DataBase.Where(&user).First(&user); err.Error != nil {
		fmt.Println(err.Error)
		c.JSON(http.StatusInternalServerError, err.Error)
	}

	fmt.Println(user)
	c.JSON(http.StatusOK, user)
}