package services

import (
	"context"
	"errors"
	"github.com/victoorraphael/simple-api/entities"
	"github.com/victoorraphael/simple-api/repository"
	"github.com/victoorraphael/simple-api/utils"
)

type PessoaService struct {
	Repo *repository.PessoaRepository
}

func (srv *PessoaService) CriarPessoa(ctx context.Context, p *entities.Pessoa) error {
	if len(p.Apelido) == 0 || len(p.Apelido) > 32 {
		return errors.New("estrutura invalida")
	}

	if len(p.Nome) == 0 || len(p.Nome) > 100 {
		return errors.New("estrutura invalida")
	}

	if p.Stack != nil && len(p.Stack) == 0 {
		return errors.New("estrutura invalida")
	}

	if p.Stack != nil {
		for _, s := range p.Stack {
			if len(s) > 32 {
				return errors.New("estrutura invalida")
			}
		}
	}

	p.ID = utils.NewUUID()
	return srv.Repo.CriarPessoa(ctx, *p)
}

func (srv *PessoaService) DetalhesPessoa(ctx context.Context) {}

func (srv *PessoaService) BuscarPessoa(ctx context.Context) {}

func (srv *PessoaService) TotalPessoasCadastradas(ctx context.Context) {}
