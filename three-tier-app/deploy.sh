#!/bin/bash

# Build images
eval $(minikube docker-env)
docker build -t frontend:latest frontend/
docker build -t backend:latest backend/

# Deploy to Kubernetes
kubectl apply -f kubernetes/backend-configmap.yaml
kubectl apply -f kubernetes/backend-secret.yaml
kubectl apply -f kubernetes/backend-deployment.yaml
kubectl apply -f kubernetes/backend-service.yaml
kubectl apply -f kubernetes/frontend-deployment.yaml
kubectl apply -f kubernetes/frontend-service.yaml

echo "Deployment complete!"
echo "Frontend: $(minikube service frontend-service --url)"
echo "Backend: $(minikube service backend-service --url)"
