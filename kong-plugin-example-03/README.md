
# Kong Plugin Example


```bash
$ curl -X POST http://kong:8001/plugins \
    --data "name=kong-plugin-example" \
    --data "config.name=Marcelo"
```

### Parametros

Lista de parametros usados no exemplo

| Form Parameter | default | description       |
| --- 			 |         |                   |
| `config.name`  |         | Nome qualquer.    |
| `config.name`  | 10      | Numero qualquer.  |
