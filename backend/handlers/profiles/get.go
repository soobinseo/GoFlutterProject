package profiles

import (
	"github.com/soobinseo/goReactCRUD/backend/constants"
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetProfilesHandler (c *gin.Context) {

	profiles := make([]models.Profile, 0)

	db.DataBase.Find(&profiles)

	c.JSON(http.StatusOK, profiles)

}


func GetProfileByIdHandler(c *gin.Context) {

	id, exist := c.Get(constants.CtxProfileId)
	if !exist {
		panic("No key error")
	}

	profile := models.Profile{}

	err := db.DataBase.First(&profile, id).Error

	if err != nil {
		c.String(http.StatusBadRequest, "Not Found Error")
	} else {
		c.JSON(http.StatusOK, profile)
	}

}
