package db

import (
	"boardProject/backend/configs"
	"github.com/go-pg/pg/v10"
)

var DataBase *pg.DB

func Connect() *pg.DB{
	db := pg.Connect(&pg.Options{
		User: "user",
		Password: configs.Password,
		Database: configs.Database,
	})

	return db
}