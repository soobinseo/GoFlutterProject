package models

import "gorm.io/gorm"

type Profile struct {
	gorm.Model
	Name         string `json:"name"`
	Gender         string `json:"gender"`
	Image         string `json:"image"`
	Job         string `json:"job"`
	Birthday         string `json:"birthday"`
}