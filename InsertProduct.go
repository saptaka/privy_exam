package main

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/logger"
)

func InsertProduct(c *gin.Context) {

	var data ProductJSON

	errBindJSON := c.BindJSON(&data)
	if errBindJSON != nil {
		logger.Errorln("unknown json format", errBindJSON)
	} else {

		product := Product{
			Name:        data.Name,
			Description: data.Description,
			Enable:      data.Enable,
		}

		db.Create(&product)
		if db.Error != nil {
			logger.Errorln("error")
		} else {
			logger.Info("Data Inserted Succesfully")
			c.String(http.StatusOK, "Ok")
		}
	}

}
