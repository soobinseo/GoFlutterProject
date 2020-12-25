package profiles

import (
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/constants"
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"net/http"
)

func UpdateProfileHandler (c *gin.Context) {

	id, exist := c.Get(constants.CtxProfileId)
	if !exist {
		panic("No key error")
	}
	profile := models.Profile{}
	var body models.Profile

	db.DataBase.First(&profile, id)

	if err := c.ShouldBind(&body); err != nil {
		panic(err)
	}

	db.DataBase.Model(&profile).Updates(&body)

	c.Status(http.StatusOK)

	// TODO: Session Handler

}