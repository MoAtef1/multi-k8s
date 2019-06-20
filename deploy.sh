docker build -t moatef/multi-client:latest -t moatef/multi-client:$SHA -f ./client/Dockerfile.dev ./client
docker build -t moatef/multi-server:latest -t moatef/multi-server:$SHA -f ./server/Dockerfile.dev ./server
docker build -t moatef/multi-worker:latest -t moatef/multi-worker:$SHA -f ./worker/Dockerfile.dev ./worker
docker push moatef/multi-client
docker push moatef/multi-server
docker push moatef/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=moatef/multi-server