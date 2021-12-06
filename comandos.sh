echo ""

echo "\n\n#############################################################"
echo "\nExecutar rota mensagem_um"
curl --location --request GET 'http://localhost:8000/mensagem_um'
sleep 1

echo "\n\n#############################################################"
echo "\nExecutar rota mensagem_dois"
curl --location --request GET 'http://localhost:8000/mensagem_dois'
sleep 1

echo "\n\n#############################################################"
echo "\nExecutar rota mensagem_tres"
curl --location --request GET 'http://localhost:8000/mensagem_tres'
sleep 1

echo "\n\n#############################################################"
echo "\nExecutar rota mensagem_quatro"
curl --location --request GET 'http://localhost:8000/mensagem_quatro'
sleep 1
