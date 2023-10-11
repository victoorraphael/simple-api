package main

import (
	"os"

	"github.com/gin-gonic/gin"
	"github.com/victoorraphael/simple-api/adapters/database"
	"github.com/victoorraphael/simple-api/handlers"
	"github.com/victoorraphael/simple-api/repository"
	"github.com/victoorraphael/simple-api/services"
)

func main() {
	db := &database.PostgresProvider{}
	db.Connect(os.Getenv("dbcn"))

	repo := repository.New(db)
	srv := services.PessoaService{Repo: repo}

	app := gin.New()

	app.POST("/pessoas", handlers.CriarPessoa(srv))

	app.Run(":8080")
}
