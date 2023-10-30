
# Projeto API TargetBank - Rex Mobile

Integração do sistema Rex com o Target Bank para geração do CIOT e Vale pedágio.
<img src="./projectBase.tldr" alt="Projeto API TargetBank" />

## Em desenvolvimento

Conexão com WS da Target

## Última alteração
<https://github.com/angelotirelli/Api.TargetBank/commit/e18df2e170b800d38066e9ffbe8159a5e916ff23>

## Métodos que serão implementados
Buscar Transportador

CadastrarAtualizarTransportador

Buscar Motorista

CadastarAtualizarMotorista

BuscarParticipante

CadastrarAtualizarParticipante

CadastrarRoteiro

BuscarRoteiro

ObterCustoRota

CadastrarAtualizarOperacaoTransporte

DeclararOperacaoTransporte

EmitirDocumento

RegistrarParcelaIndividual

PagarParcelaIndividual

ComprarPedagioAvulso

ConfirmarPedagioTag

EncerrarOperaçãoTransporte

BuscaOperacaoTransporte

BuscarCompraValePedagio

CancelarOperacaoTransporte

CancelarCompraValePedagio

## Desenvolvimentos concluídos

Conexão com o banco de dados

CRUD

Métodos GET, POST, PUT e DELETE 

## Documentação da API

#### Retorna todos os itens

```http
  GET /api/cadastro
```

| Parâmetro   | Tipo       | Descrição                           | Obrigatório |
| :---------- | :--------- | :---------------------------------- | :-----------|
| `api_key` | `string` | A chave da sua API | Sim |

#### Retorna um item

```http
  GET /api/cadastro/($id)
```

| Parâmetro   | Tipo       | Descrição                                   | Obrigatório |
| :---------- | :--------- | :------------------------------------------ | :-----------|
| `id`      | `Integer` |  O ID do cadastro que você quer | Sim |


# Target Bank
Link da documentação da Tagert Bank:

<https://targetbank.atlassian.net/wiki/spaces/DOC/pages/402194481/1-+WS+2.0+Frete+Ambientes/>
