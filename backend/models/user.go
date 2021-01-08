package models

import (
	"gorm.io/gorm"
)

type User struct {
	gorm.Model
	Email         string `json:"email" gorm:"uniqueIndex;not null;type:varchar(255)"`
	Password      string `json:"password" gorm:"not null;type:varchar(255)"`
	Posts		  []Post `json:"posts"`
	Comments 		[]Comment `json:"comments"`
	Followers		[]*User `gorm:"many2many:user_followers"`
	UserDetail		UserDetail `json:"userDetail"`
	RefreshToken	string `gorm:"uniqueIndex"`
}

type UserDetail struct {
	gorm.Model
	UserID uint `json:"userId"`
	Image string `json:"image" gorm:"not null;type:varchar(255)"`
	Name string `json:"name" gorm:"not null;type:varchar(255)"`
	Title string `json:"title" gorm:"type:varchar(255)"`
	Introduce string `json:"introduce" gorm:"type:varchar(255)"`
	Careers *[]Career `json:"careers"`
	Educations *[]Education `json:"educations"`
	LikePosts	[]*Post `json:"likePosts" gorm:"many2many:likeUser_likePosts"`
}

type Career struct {
	gorm.Model
	UserDetailID uint `json:"userDetailId"`
	Company string `json:"company" gorm:"type:varchar(255)"`
	Title string `json:"title" gorm:"type:varchar(255)"`
}

type Education struct {
	gorm.Model
	UserDetailID uint `json:"userDetailId"`
	University string `json:"university" gorm:"type:varchar(255)"`
	Major string `json:"major" gorm:"type:varchar(255)"`
}
