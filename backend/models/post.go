package models

import "gorm.io/gorm"

type Post struct {
	gorm.Model
	Title string `json:"title"`
	Body string `json:"body"`
	Image string `json:"image"`
	UserID uint `json:"userID"`

}