package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/logger"
)

func InsertImage(c *gin.Context) {

	var data ImageJSON

	errBindJSON := c.BindJSON(&data)
	if errBindJSON != nil {
		logger.Errorln("unknown json format", errBindJSON)
	} else {

		image := Image{
			Name:   data.Name,
			File:   data.File,
			Enable: data.Enable,
		}

		db.Create(&image)
		if db.Error != nil {
			logger.Errorln("error")
		} else {
			logger.Info("Data Inserted Succesfully")
			c.String(http.StatusOK, "Ok")
		}
	}

}
