package main

import (
	"github.com/gin-gonic/gin"
)

func GetCategoryProduct(c *gin.Context) {
	var category []Category
	name := c.Param("name")
	db.Where("name = ?", name).Find(&category)

	c.JSON(200, category)
}
