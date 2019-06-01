package main

import (
	"github.com/gin-gonic/gin"
	"github.com/google/logger"
)

func UpdateCategory(c *gin.Context) {
	var data CategoryJSON
	var category Category

	errBindJSON := c.BindJSON(&data)
	if errBindJSON != nil {
		logger.Errorln("unknown json format", errBindJSON)
	} else {
		if c.Param("column") == "name" {
			db.Model(&category).Where("id = ?", data.ID).UpdateColumn("name", data.Name)
		} else if c.Param("column") == "enable" {
			db.Model(&category).Where("id = ?", data.ID).UpdateColumn("enable", data.Enable)
		} else if c.Param("column") == "all" {
			db.Model(&category).Where("id = ?", data.ID).UpdateColumns(data)
		} else {
			c.JSON(404, "request not found")
		}
	}

}
