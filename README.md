
# Projeto API TargetBank - Rex Mobile

Integração do sistema Rex com o Target Bank para geração do CIOT e Vale pedágio.

## Documentação da API

#### Retorna todos os itens

```http
  GET /api/cadastro
```

| Parâmetro   | Tipo       | Descrição                           |
| :---------- | :--------- | :---------------------------------- |
| `api_key` | `string` | **Obrigatório**. A chave da sua API |

#### Retorna um item

```http
  GET /api/cadastro/($id)
```

| Parâmetro   | Tipo       | Descrição                                   |
| :---------- | :--------- | :------------------------------------------ |
| `id`      | `Integer` | **Obrigatório**. O ID do cadastro que você quer |




