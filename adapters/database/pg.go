package database

import (
	"context"
	"github.com/jackc/pgx/v5"
	"log"
)

type PostgresProvider struct {
	conn *pgx.Conn
}

func (p *PostgresProvider) Exec() *pgx.Conn {
	return p.conn
}

func (p *PostgresProvider) Connect(dbcn string) {
	conn, err := pgx.Connect(context.Background(), dbcn)
	if err != nil {
		log.Fatal(err)
	}
	p.conn = conn
}

func (p *PostgresProvider) Close() error {
	return p.conn.Close(context.Background())
}
