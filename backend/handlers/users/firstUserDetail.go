package users

import (
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"gorm.io/gorm"
	"gorm.io/gorm/clause"
	"net/http"
)

func FirstUserDetailHandler (c *gin.Context) {

	//_userId, _ := c.Get("userId")
	//userId := _userId.(uint)
	res := models.UserDetail{}
	if err := c.ShouldBind(&res); err != nil {
		c.JSON(http.StatusBadRequest, err.Error())
	}

	//if err := CreateFirstUserTransaction(db.DataBase, &res, userId); err != nil {
	//	c.JSON(http.StatusInternalServerError, err.Error())
	//}
	db.DataBase.Save(&res)

	c.Status(http.StatusOK)

}

func CreateFirstUserTransaction(db *gorm.DB, res *models.UserDetail, userId uint) error {
	tx := db.Begin()
	defer func() {
		if r := recover(); r != nil {
			tx.Rollback()
		}
	}()

	if err := tx.Error; err != nil {
		return err
	}

	usersDetail := models.UserDetail{UserID: userId}

	tx.Where(&usersDetail).First(&usersDetail)
	usersDetail.Image = res.Image
	usersDetail.Name = res.Name
	usersDetail.Title = res.Title
	usersDetail.Introduce = res.Introduce

	for _, career := range res.Careers {
		career.UserDetailID = userId
	}
	for _, education := range res.Educations {
		education.UserDetailID = userId
	}

	if err := db.Omit(clause.Associations).Save(&usersDetail).Error; err != nil {
		tx.Rollback()
		return err
	}

	if err := tx.Create(&res.Careers).Error; err != nil {
		tx.Rollback()
		return err
	}

	if err := tx.Create(&res.Educations).Error; err != nil {
		tx.Rollback()
		return err
	}

	return tx.Commit().Error
}