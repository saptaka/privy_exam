package main

import "github.com/gin-gonic/gin"

func DeleteProduct(c *gin.Context) {
	db.Where("id = ?", c.Param("id")).Delete(&Product{})
}
