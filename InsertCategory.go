package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/logger"
)

func InsertCategory(c *gin.Context) {

	var data CategoryJSON

	errBindJSON := c.BindJSON(&data)
	if errBindJSON != nil {
		logger.Errorln("unknown json format", errBindJSON)
	} else {

		category := Category{
			Name:        data.Name,
			Description: data.Description,
			Enable:      data.Enable,
		}

		db.Create(&category)
		if db.Error != nil {
			logger.Errorln("error")
		} else {
			logger.Info("Data Inserted Succesfully")
			c.String(http.StatusOK, "Ok")
		}
	}

}
