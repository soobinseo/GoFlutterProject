package main

import (
	"boardProject/backend"
	"boardProject/backend/db"
)

func main() {

	if db.DataBase == nil {
		db.DataBase = db.Connect()
	}

	backend.Application()
	defer db.DataBase.Close()


}
