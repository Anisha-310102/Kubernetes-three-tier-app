#!/bin/bash

echo "🚀 Starting 3-tier application deployment..."

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

echo "✅ Deployment complete!"
echo ""
echo "📋 Application Status:"
kubectl get pods

# Get URLs
FRONTEND_URL=$(minikube service frontend-service --url)
BACKEND_URL=$(minikube service backend-service --url)

echo ""
echo "🌐 Application URLs:"
echo "Frontend: $FRONTEND_URL"
echo "Backend:  $BACKEND_URL"
echo ""
echo "💡 To open in browser, run:"
echo "   minikube service frontend-service"
echo ""
echo "🔧 Quick test:"
curl -s $BACKEND_URL/health | grep status
echo ""

# Try to open browser (macOS)
if command -v open >/dev/null 2>&1; then
    echo "🌐 Opening frontend in browser..."
    open $FRONTEND_URL
fi
