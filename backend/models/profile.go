package models


type Profile struct {
	Id			int `json:"id"`
	Name         string `json:"name"`
	Gender         string `json:"gender"`
	Image         string `json:"image"`
	Job         string `json:"job"`
	Age         string `json:"age"`
}