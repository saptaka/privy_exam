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
		db.SingularTable(true)
	}

	api := gin.Default()
	api.GET("/product/:name", GetProduct)
	api.GET("/category/:name", GetCategory)
	api.GET("/image/:name", GetImage)

	api.Use(InsertCaterogyProduct)

	api.POST("/insertProduct", InsertProduct)
	api.POST("/insertCategory", InsertCategory)
	api.POST("/insertImage", InsertImage)

	api.POST("/setProduct/:column", UpdateProduct)
	api.POST("/setCategory/:column", UpdateCategory)
	api.POST("/settImage/:column", UpdateImage)

	api.Run(":8898")

}
