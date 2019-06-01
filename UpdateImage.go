package main

import (
	"github.com/gin-gonic/gin"
	"github.com/google/logger"
)

func UpdateImage(c *gin.Context) {
	var data ImageJSON
	var image ImageJSON

	errBindJSON := c.BindJSON(&data)
	if errBindJSON != nil {
		logger.Errorln("unknown json format", errBindJSON)
	} else {
		if c.Param("column") == "name" {
			db.Model(&image).Where("id = ?", data.ID).UpdateColumn("name", data.Name)
		} else if c.Param("column") == "file" {
			db.Model(&image).Where("id = ?", data.ID).UpdateColumn("description", data.File)
		} else if c.Param("column") == "enable" {
			db.Model(&image).Where("id = ?", data.ID).UpdateColumn("enable", data.Enable)
		} else if c.Param("column") == "all" {
			db.Model(&image).Where("id = ?", data.ID).UpdateColumns(data)
		} else {
			c.JSON(404, "request not found")
		}
	}

}
