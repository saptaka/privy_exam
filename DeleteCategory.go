package main

import "github.com/gin-gonic/gin"

func DeleteCategory(c *gin.Context) {
	db.Where("id = ?", c.Param("id")).Delete(&Category{})
}
