package httpserver

import (
	"fmt"
	"github.com/gin-gonic/gin"
)

func Init() {
	fmt.Println("Init a httpserver!")
	r := gin.Default()
    Router(r)
    r.Run("0.0.0.0:8080") // listen and serve on 0.0.0.0:8080
}
