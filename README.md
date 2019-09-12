# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby **2.6.4**

* System dependencies

* Configuration

* ...

## Consulta de conta por CPF


### Exemplo de rota
#### get '/api/v1/search/account?document=12345678900'

Sucesso:

HTTP Status: 200

Result example: 

```json
{
  \"id\":1,
\"created_at\":\"2019-09-12T17:55:42.383Z\",\"updated_at\":\"2019-09-12T17:55:42.383Z\",
\"email\":\"email@email.com\",
\"schedule_id\":null,
\"document\":\"12345678900\"
}
```

Erro:

HTTP Status: 404

Result example:

```json
{
  \"msg\":\"Conta não encontrada\"
}
```
