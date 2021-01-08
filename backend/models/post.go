package models

import "gorm.io/gorm"

type Post struct {
	gorm.Model
	Title string `json:"title" gorm:"not null;type:varchar(255)"`
	Body string `json:"body" gorm:"not null;type:varchar(255)"`
	Image string `json:"image"`
	UserID uint `json:"userID"`
	Comments Comment `json:"comments"`
	LikePosts	[]*UserDetail `gorm:"many2many:likeUser_likePosts"`
}

type Comment struct {
	gorm.Model
	UserID uint `json:"userId"`
	PostID uint `json:"postId"`
	Text string `json:"postId" gorm:"not null;type:varchar(255)"`
}