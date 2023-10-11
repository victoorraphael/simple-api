package database

type Provider[K any] interface {
	Exec() K
	Connect(dbcn string)
	Close() error
}
