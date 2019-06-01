package main

import "github.com/gin-gonic/gin"

func DeleteImage(c *gin.Context) {
	db.Where("id = ?", c.Param("id")).Delete(&Image{})
}
