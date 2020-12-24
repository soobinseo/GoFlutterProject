package handlers

import (
	"github.com/soobinseo/goReactCRUD/backend/models"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetProfilesHandler (c *gin.Context) {

	customers := []models.Profile{

		{
			Name:   "홍길동",
			Image:  "http://placeimg.com/64/64/1",
			Birthday:    "29",
			Job:    "개발자",
			Gender: "남자",
		},
		{
			Name:   "홍길동",
			Image:  "http://placeimg.com/64/64/2",
			Birthday:    "29",
			Job:    "개발자",
			Gender: "남자",
		},
		{
			Name:   "홍길동",
			Image:  "http://placeimg.com/64/64/3",
			Birthday:    "29",
			Job:    "개발자",
			Gender: "남자",
		},
	}

	c.JSON(http.StatusOK, customers)

}
