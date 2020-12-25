package profiles

import (
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/constants"
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"net/http"
)

func DeleteProfileHandler (c *gin.Context) {

	id, exist := c.Get(constants.CtxProfileId)
	if !exist {
		panic("No key error")
	}

	profile := models.Profile{}

	err := db.DataBase.Delete(&profile, id).Error

	if err != nil {
		c.String(http.StatusBadRequest, "Not Found Error")
	} else {
		c.Status(http.StatusOK)
	}

	// TODO: Session Handler

}