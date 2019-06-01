package main

import "github.com/gin-gonic/gin"

func GetImage(c *gin.Context) {
	var image []Image
	name := c.Param("name")
	db.Where("name = ?", name).Find(&image)

	c.JSON(200, image)
}
