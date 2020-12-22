package handlers

import (
	"boardProject/backend/models"
	"github.com/gin-gonic/gin"
	"net/http"
)

func GetProfilesHandler (c *gin.Context) {

	customers := []models.Profile{

			{
				Name:   "홍길동",
				Image:  "http://placeimg.com/64/64/1",
				Id:     1,
				Age:    "29",
				Job:    "개발자",
				Gender: "남자",
			},
		{
			Name:   "홍길동",
			Image:  "http://placeimg.com/64/64/2",
			Id:     2,
			Age:    "29",
			Job:    "개발자",
			Gender: "남자",
		},
		{
			Name:   "홍길동",
			Image:  "http://placeimg.com/64/64/3",
			Id:     3,
			Age:    "29",
			Job:    "개발자",
			Gender: "남자",
		},


	}
	c.JSON(http.StatusOK, customers)

}
