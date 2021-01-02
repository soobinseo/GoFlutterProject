package models

import "gorm.io/gorm"

type User struct {
	gorm.Model
	Name         string `json:"name" bson:"name"`
	Email         string `json:"email" bson:"email" gorm:"uniqueIndex"`
	Password      string `json:"password" bson:"password"`
	Posts		  []Post
}