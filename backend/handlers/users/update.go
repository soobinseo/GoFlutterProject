package users

import (
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"gorm.io/gorm/clause"
	"net/http"
)

func UpdateDetailHandler (c *gin.Context) {

	_userId, _ := c.Get("userId")
	userId := _userId.(uint)
	res := models.UserDetail{}
	if err := c.ShouldBind(&res); err != nil {
		c.JSON(http.StatusBadRequest, err.Error())
	}

	usersDetail := models.UserDetail{}
	db.DataBase.First(&usersDetail, userId)

	usersDetail.Image = res.Image
	usersDetail.Name = res.Name
	usersDetail.Title = res.Title
	usersDetail.Introduce = res.Introduce

	if err := db.DataBase.Omit(clause.Associations).Save(&usersDetail).Error; err != nil {
		c.JSON(http.StatusInternalServerError, err.Error())
	}

	c.Status(http.StatusOK)

	// TODO: Session Handler

}