package profiles

import (
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"github.com/gin-gonic/gin"
	"net/http"
)

func PostProfileHandler (c *gin.Context) {

	var body models.Profile
	//db.DataBase.AutoMigrate(&models.Profile{})

	if err := c.ShouldBind(&body); err != nil {
		panic(err)
	}

	db.DataBase.Create(&body)

	c.String(http.StatusOK, "CREATE")

}
