package main

import (
	"github.com/gin-gonic/gin"
	"github.com/google/logger"
)

func UpdateProduct(c *gin.Context) {
	var data ProductJSON
	var product Product

	errBindJSON := c.BindJSON(&data)
	if errBindJSON != nil {
		logger.Errorln("unknown json format", errBindJSON)
	} else {
		if c.Param("column") == "name" {
			db.Model(&product).Where("id = ?", data.ID).UpdateColumn("name", data.Name)
		} else if c.Param("column") == "description" {
			db.Model(&product).Where("id = ?", data.ID).UpdateColumn("description", data.Description)
		} else if c.Param("column") == "enable" {
			db.Model(&product).Where("id = ?", data.ID).UpdateColumn("enable", data.Enable)
		} else if c.Param("column") == "all" {
			db.Model(&product).Where("id = ?", data.ID).UpdateColumns(data)
		} else {
			c.JSON(404, "request not found")
		}
	}

}
