package main

import (
	"github.com/gin-gonic/gin"
)

func GetProduct(c *gin.Context) {
	var product []Product
	name := c.Param("name")
	db.Where("name = ?", name).Find(&product)

	c.JSON(200, product)
}
