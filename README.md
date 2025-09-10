# 3-Tier Kubernetes Application

A complete 3-tier web application deployed on Kubernetes using Minikube.

## 🏗️ Architecture

- **Frontend**: Nginx serving HTML/JS/CSS
- **Backend**: Node.js Express API
- **Database**: PostgreSQL (to be implemented)
- **Orchestration**: Kubernetes with Minikube

## 🚀 Quick Start

### Prerequisites
- Minikube
- kubectl
- Docker

### Deployment
```bash
# Start Minikube
minikube start

# Use Minikube's Docker daemon
eval $(minikube docker-env)

# Build and deploy
./deploy.sh

