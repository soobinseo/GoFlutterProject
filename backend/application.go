package backend

import (
	"fmt"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/soobinseo/goReactCRUD/backend/handlers/profiles"
	"github.com/soobinseo/goReactCRUD/backend/middlewares"
	"log"
	"net/http"
	"time"
)

func Application() {

	gin.SetMode(gin.DebugMode)
	r := gin.Default()
	var PORT= 8000

	r.Use(cors.New(cors.Config{
		AllowOrigins: []string{"*"},
		AllowMethods: []string{http.MethodGet, http.MethodPost, http.MethodPut, http.MethodPatch, http.MethodDelete},
		AllowHeaders: []string{"Accept", "Accept-Language", "Content-Language", "Origin", "Content-Type", "Authorization"},
	}))

	// add handlers

	r_api := r.Group("api/")
	r_api.Use(middlewares.ParseParamMiddleware)
	{
		r_api.GET("profile", profiles.GetProfilesHandler)
		r_api.POST("profile", profiles.PostProfileHandler)
		{
			r_api.GET("profile/:profileId", profiles.GetProfileByIdHandler)
			r_api.DELETE("profile/:profileId", profiles.DeleteProfileHandler)
			r_api.PUT("profile/:profileId", profiles.UpdateProfileHandler)
		}
	}



	server := &http.Server{
		Handler:      r,
		Addr:         fmt.Sprintf("0.0.0.0:%d", PORT),
		ReadTimeout:  10 * time.Second,
		WriteTimeout: 10 * time.Second,
	}

	if err := server.ListenAndServe(); err != nil {
		log.Fatal(err)
	}
}