
# Kong Plugin Example do configurações com consumers


1) criar consumer
   curl -i -X POST \
   --url http://localhost:8001/consumers/ \
   --data "username=kongUsuario"

2) Criar Apikey (detalhe na rota esta o username acima)
   curl -i -X POST \
   --url http://localhost:8001/consumers/kongUsuario/key-auth/ \
   --data 'key=teste_consumer'

3) criar Service

    curl --location --request POST 'http://localhost:8001/services'  --form 'name="exemplo_service"'  --form 'url="https://run.mocky.io/v3/e002349c-8c93-4022-913b-df9cb6960605"'

4) Criar Rota

curl --location -g --request POST 'http://localhost:8001/services/exemplo_service/routes' --form 'paths[]="/exemplo"'

Observação: Aqui chamando a rota não temos autenticação e não esta sendo usado o consumer   
curl --location --request GET http://localhost:8000/exemplo

5) adicionar plugin no service para usar o consumer configurado

curl -X POST http://localhost:8001/services/exemplo_service/plugins \
--data "name=key-auth"  \
--data "config.key_names=apikey" \
--data "config.key_in_body=false" \
--data "config.key_in_header=true" \
--data "config.key_in_query=true" \
--data "config.hide_credentials=false" \
--data "config.run_on_preflight=true"

Observação: Aqui chamando a rota sem passar o header recebemos a mensagem abaixo
{
"message":"No API key found in request"
}

Chamada correta
curl --location --request GET 'localhost:8000/exemplo' \
--header 'apikey: teste_consumer'

6) Adicionar ratelimit no consumer
   curl -X POST http://localhost:8001/consumers/kongUsuario/plugins \
   --data "name=rate-limiting"  \
   --data "config.minute=2" \
   --data "config.policy=local" 

Quando chamar a rota, depois da 2 tentativa por minuto, recebemos

{
"message":"API rate limit exceeded"
}
