package repository

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/victoorraphael/simple-api/adapters/database"
	"github.com/victoorraphael/simple-api/entities"
)

type PessoaRepository struct {
	db database.Provider[*pgx.Conn]
}

func (repo *PessoaRepository) CriarPessoa(ctx context.Context, p entities.Pessoa) error {
	tx, err := repo.db.Exec().Begin(ctx)
	if err != nil {
		return err
	}
	defer tx.Rollback(ctx)

	query := "insert into pessoas(id, apelido, nome, nascimento, stack) values ($1,$2,$3,$4,$5)"
	_, err = tx.Exec(ctx, query, p.ID, p.Apelido, p.Nome, p.Nascimento, p.Stack)
	if err != nil {
		return err
	}

	err = tx.Commit(ctx)
	return err
}
