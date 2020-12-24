package db

import (
	"fmt"
	"github.com/soobinseo/goReactCRUD/backend/configs"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
)

var DataBase *gorm.DB

func Connect() *gorm.DB{
	value := []interface{}{configs.Host, configs.Password, configs.Database}
	dsn := fmt.Sprintf("host=%s user=user password=%s dbname=%s port=5432 sslmode=disable TimeZone=Asia/Seoul", value...)
	fmt.Println(dsn)
	db, err := gorm.Open(postgres.Open(dsn), &gorm.Config{})

	if err != nil {
		panic(err)
	}

	return db
}