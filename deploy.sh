docker build -t robbinakm/client:latest -t robbinakm/client:$SHA -f ./client/Dockerfile ./client
docker build -t robbinakm/server:latest -t robbinakm/server:$SHA -f ./server/Dockerfile ./server
docker build -t robbinakm/worker:latest -t robbinakm/worker:$SHA -f ./worker/Dockerfile ./worker
docker push robbinakm/client:latest
docker push robbinakm/server:latest
docker push robbinakm/worker:latest
docker push robbinakm/client:$SHA
docker push robbinakm/server:$SHA
docker push robbinakm/worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/client-deployment client=robbinakm/client:$SHA
kubectl set image deployments/server-deployment server=robbinakm/server:$SHA
kubectl set image deployments/worker-deployment worker=robbinakm/worker:$SHA
