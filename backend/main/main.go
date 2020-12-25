package main

import (
	"github.com/soobinseo/goReactCRUD/backend"
	"github.com/soobinseo/goReactCRUD/backend/db"
)

func main() {

	if db.DataBase == nil {
		db.DataBase = db.Connect()
	}

	backend.Application()
}
