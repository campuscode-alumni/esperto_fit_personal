<<<<<<< HEAD
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
  "id":1,
  "created_at":"2019-09-12T17:55:42.383Z",
  "updated_at":"2019-09-12T17:55:42.383Z",
  "email":"email@email.com",
  "schedule_id":null,
  "document":"12345678900"
}
```

Erro:

HTTP Status: 404

Result example:

```json
{
  "msg": "Conta não encontrada"
}
```

## Consulta Personal Trainers


### Exemplos de rota

para listar todos os personais
#### get '/api/v1/personals'

ou para filtrar por unidades
#### get '/api/v1/unit/personals?id=21'

Sucesso:

HTTP Status: 200

Result example:

```json
[
  {
  "email": "personal1@mail.com",
  "profile":{
    "first_name": "Personal1",
    "last_name": "da Silva"
    }
  },{
    "email":"personal2@mail.com",
    "profile":{
        "first_name":"Personal2",
        "last_name":"da Costa"
    }
  },{
    "email":"personal3@mail.com",
    "profile":{
      "first_name":"Personal3",
      "last_name":"de Souza"
    }
  }
]
```

Erro:

A consulta não retornou nenhum resultado

HTTP Status: 404

Result example:

```json
{
  "msg":"Nenhum personal encontrado"
}
```

Erro:

Parametro unit passado não é inteiro

HTTP Status: 412

Result example:

```json
{
  "msg":"Parametro unidade espera id de Unidade"
}
```

## Consulta de Customer

### Exemplo de rota
#### get 'api/v1/customers?id=1'

Sucesso:

HTTP Status: 202

Result Exemple:

```json
{
  "id": 1,
  "first_name": "Arlindo",
  "last_name": "Castanho",
  "date_of_birth": "1988-09-22",
  "gender": "male",
  "address": "Rua da Saudade, 333",
  "contact": "2345-3333",
  "nickname": "lindin",
  "payment_method": "débito"
}
```
=======
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
#### get "/api/v1/search/account/#{cpf}"

Sucesso:

HTTP Status: 200

Result example:

```json
{
  "id":1,
  "created_at":"2019-09-12T17:55:42.383Z",
  "updated_at":"2019-09-12T17:55:42.383Z",
  "email":"email@email.com",
  "schedule_id":null,
  "document":"12345678900"
}
```

Erro:

HTTP Status: 404

Result example:

```json
{
  "msg": "Conta não encontrada"
}
```

## Consulta Personal Trainers


### Exemplos de rota

para listar todos os personais
#### get '/api/v1/personals'

ou para filtrar por unidades
#### get "/api/v1/unit/personals/#{id}"

Sucesso:

HTTP Status: 200

Result example:

```json
[
  {
  "email": "personal1@mail.com",
  "profile":{
    "first_name": "Personal1",
    "last_name": "da Silva"
    }
  },{
    "email":"personal2@mail.com",
    "profile":{
        "first_name":"Personal2",
        "last_name":"da Costa"
    }
  },{
    "email":"personal3@mail.com",
    "profile":{
      "first_name":"Personal3",
      "last_name":"de Souza"
    }
  }
]
```

Erro:

A consulta não retornou nenhum resultado

HTTP Status: 404

Result example:

```json
{
  "msg":"Nenhum personal encontrado"
}
```

Erro:

Parametro unit passado não é inteiro

HTTP Status: 412

Result example:

```json
{
  "msg":"Parametro unidade espera id de Unidade"
}
```

## Consulta de Customer

### Exemplo de rota
#### get "/api/v1/search/customer?document=12345678900"

Sucesso:

HTTP Status: 202

Result Exemple:

```json
{
  "id": 1,
  "first_name": "Arlindo",
  "last_name": "Castanho",
  "date_of_birth": "1988-09-22",
  "gender": "male",
  "address": "Rua da Saudade, 333",
  "contact": "2345-3333",
  "nickname": "lindin",
  "payment_method": "débito"
}
```

Erro:

HTTP Status: 404

Result example:

```json
{
  "msg": "Não encontrada"
}
```
>>>>>>> 58b0d5b720082fd48507e8cd07cf0367274200a5
