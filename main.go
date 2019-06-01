package main

import (
	"flag"
	"fmt"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/google/logger"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

const logPath = "log.log"

var verbose = flag.Bool("verbose", false, "print info level logs to stdout")

var (
	db           *gorm.DB
	errConnectDB error
)

func InsertCategory(c *gin.Context) {
	resp := map[string]string{"hello": "world"}
	c.JSON(200, resp)
}

func GetProduct(c *gin.Context) {
	resp := map[string]string{"hello": "world"}
	c.JSON(200, resp)
}

func InsertCaterogyProduct(c *gin.Context) {
	fmt.Println("Im a dummy!")

	c.Next()
}

func main() {
	logFile, err := os.OpenFile(logPath, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0660)
	if err != nil {
		logger.Fatalf("Failed to open log file: %v", err)
	}
	defer logFile.Close()

	defer logger.Init("LogginSystem", *verbose, true, logFile).Close()

	db, errConnectDB = gorm.Open("postgres", "host=localhost port=5432 user=postgres dbname=privyID_test password=halopsql sslmode=disable")
	if errConnectDB != nil {
		logger.Fatalf("Failed to connect database: %v", errConnectDB)
	} else {
		logger.Infoln("Database Connected!")

	}

	api := gin.Default()
	api.GET("/product", GetProduct)
	api.POST("/insertProduct", InsertProduct)
	api.Use(InsertCaterogyProduct)
	api.Run(":8898")

}
