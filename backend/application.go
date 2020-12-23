package backend

import (
	"boardProject/backend/handlers"
	"fmt"
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
	"time"
)

func Application() {

	gin.SetMode(gin.DebugMode)
	r := gin.Default()
	var PORT = 8000

	r.Use(cors.New(cors.Config{
		AllowOrigins: []string{"*"},
		AllowMethods: []string{http.MethodGet, http.MethodPost, http.MethodPut, http.MethodPatch, http.MethodDelete},
		AllowHeaders: []string{"Accept", "Accept-Language", "Content-Language", "Origin", "Content-Type", "Authorization"},
	}))

	// add handlers
	r.GET("api/profile", handlers.GetProfilesHandler)
	r.POST("api/profile", handlers.PostProfileHandler)

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