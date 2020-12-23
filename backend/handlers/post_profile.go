package handlers

import (
	"boardProject/backend/db"
	"boardProject/backend/models"
	"github.com/gin-gonic/gin"
	"net/http"
)

func PostProfileHandler (c *gin.Context) {

	var body models.Profile

	if err := c.ShouldBind(&body); err != nil {
		panic(err)
	}

	if _, err := db.DataBase.Model(&body).Insert(); err != nil{
		panic(err)
	}

	c.String(http.StatusOK, "CREATE")

}
