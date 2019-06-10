package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/gin-gonic/gin"
	"github.com/google/logger"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/postgres"
)

type Config struct {
	Port    string `json:"port"`
	LogPath string `json:"log_path"`
}

var verbose = flag.Bool("verbose", false, "print info level logs to stdout")

var (
	db           *gorm.DB
	errConnectDB error
	port         string
	logPath      string
	config       Config
)

func InsertCaterogyProduct(c *gin.Context) {
	fmt.Println("Im a dummy!")

	c.Next()
}

func init() {
	fileConfig, err := os.Open("config.json")

	if err != nil {
		log.Fatal("File config.json not found")
	}
	byteConfig, _ := ioutil.ReadAll(fileConfig)
	json.Unmarshal(byteConfig, &config)
	port = config.Port
	logPath = config.LogPath + "log.log"
}

func main() {
	logFile, err := os.OpenFile(logPath, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0660)
	if err != nil {
		logger.Fatalf("Failed to open log file: %v", err)
	}
	defer logFile.Close()

	defer logger.Init("LoggingSystem", *verbose, true, logFile).Close()

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
	api.GET("/categoryProduct", GetCategoryProduct)
	api.GET("/imageProduct", GetImageProduct)

	api.POST("/insertProduct", InsertProduct)
	api.POST("/insertCategory", InsertCategory)
	api.POST("/insertImage", InsertImage)

	api.PUT("/setProduct/:column", UpdateProduct)
	api.PUT("/setCategory/:column", UpdateCategory)
	api.PUT("/setImage/:column", UpdateImage)

	api.DELETE("/delProduct/:id", DeleteProduct)
	api.DELETE("/delCategory/:id", DeleteCategory)
	api.DELETE("/delImage/:id", DeleteImage)

	api.Run(":" + port)

}
