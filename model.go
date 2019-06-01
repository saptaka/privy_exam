package main

type Product struct {
	ID          int8 `gorm:"primary_key"`
	Name        string
	Description string
	Enable      bool
}

type ProductJSON struct {
	ID          int8   `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Enable      bool   `json:"enable"`
}

type Category struct {
	ID     int8 `gorm:"primary_key"`
	Name   string
	Enable bool
}

type CategoryJSON struct {
	ID     int8   `json:"id"`
	Name   string `json:"name"`
	Enable bool   `json:"enable"`
}

type Image struct {
	ID     int8 `gorm:"primary_key"`
	Name   string
	File   string
	Enable bool
}

type ImageJSON struct {
	ID     int8   `json:"id"`
	Name   string `json:"name"`
	File   string `json:"description"`
	Enable bool   `json:"enable"`
}

type Category_Product struct {
	ID          int8 `gorm:"primary_key"`
	Product_Id  int8
	Category_Id int8
}

type Product_Image struct {
	ID         int8 `gorm:"primary_key"`
	Product_Id int8
	Image_Id   int8
}
