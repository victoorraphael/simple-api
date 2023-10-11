package repository

import (
	"context"
	"github.com/jackc/pgx/v5"
	"github.com/victoorraphael/simple-api/adapters/database"
	"github.com/victoorraphael/simple-api/entities"
	"strings"
)

type PessoaRepository struct {
	db database.Provider[*pgx.Conn]
}

func New(provider database.Provider[*pgx.Conn]) *PessoaRepository {
	return &PessoaRepository{db: provider}
}

func (repo *PessoaRepository) CriarPessoa(ctx context.Context, p entities.Pessoa) error {
	tx, err := repo.db.Exec().Begin(ctx)
	if err != nil {
		return err
	}
	defer tx.Rollback(ctx)

	query := "insert into pessoas(id, apelido, nome, nascimento, stack) values ($1,$2,$3,$4,$5)"
	_, err = tx.Exec(ctx, query, p.ID, p.Apelido, p.Nome, p.Nascimento, strings.Join(p.Stack, ","))
	if err != nil {
		return err
	}

	err = tx.Commit(ctx)
	return err
}

func (repo *PessoaRepository) BuscarPessoaPorID(ctx context.Context, id string) (entities.Pessoa, error) {
	var p entities.Pessoa
	query := "select * from pessoas where id = $1"
	err := repo.db.Exec().QueryRow(ctx, query, id).Scan(&p.ID, &p.Apelido, &p.Nome, &p.Nascimento, &p.Stack)

	return p, err
}

func (repo *PessoaRepository) BuscarPessoas(ctx context.Context, search string) ([]entities.Pessoa, error) {
	list := make([]entities.Pessoa, 0)
	query := "select * from pessoas p where p.apelido ILIKE '%$1%' or p.nome ILIKE '%$1%' or p.stack ILIKE '%$1%'"
	rows, err := repo.db.Exec().Query(ctx, query, search)
	if err != nil {
		return list, err
	}

	for rows.Next() {
		var p entities.Pessoa
		err := rows.Scan(&p.ID, &p.Apelido, &p.Nome, &p.Nascimento, &p.Stack)
		if err != nil {
			return list, err
		}
	}

	return list, rows.Err()
}

func (repo *PessoaRepository) TotalPessoas(ctx context.Context) (int64, error) {
	var total int64
	err := repo.db.Exec().QueryRow(ctx, "select COUNT(id) from pessoas").Scan(&total)
	return total, err
}
