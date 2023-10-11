package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/victoorraphael/simple-api/entities"
	"github.com/victoorraphael/simple-api/services"
)

func CriarPessoa(srv services.PessoaService) gin.HandlerFunc {
	return func(c *gin.Context) {
		var req entities.Pessoa
		if err := c.ShouldBind(&req); err != nil {
			c.AbortWithStatus(http.StatusBadRequest)
			return
		}

		if err := srv.CriarPessoa(c, &req); err != nil {
			c.AbortWithStatus(http.StatusBadRequest)
			return
		}

		c.Status(201)
	}
}
