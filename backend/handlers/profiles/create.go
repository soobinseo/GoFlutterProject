package profiles

import (
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/db"
	"github.com/soobinseo/goReactCRUD/backend/models"
	"net/http"
)

func PostProfileHandler (c *gin.Context) {

	// upload data to storage
	//middlewares.UploadGCSMiddleWare(c)

	var body models.Profile
	//db.DataBase.AutoMigrate(&models.Profile{})

	if err := c.ShouldBind(&body); err != nil {
		panic(err)
	}

	db.DataBase.Create(&body)

	c.String(http.StatusOK, "CREATE")

}
