echo "Criando as imagens......."

docker build -t felipecarpanezi/projeto-backend:1.0 backend/.
docker build -t felipecarpanezi/projeto-database:1.0 database/.

echo "Realizando o push das imagens...."

docker push felipecarpanezi/projeto-backend:1.0
docker push felipecarpanezi/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yaml

echo "realizando os deployments..."

kubectl apply -f ./deployment.yaml