#!/bin/bash

echo "Starting Minikube..."
minikube start

echo "Waiting for Minikube to be ready..."
sleep 10

echo "Applying ConfigMap and Secret..."
kubectl apply -f ~/Downloads/demo/k8s/mysql-configmap.yaml

echo "Applying PersistentVolume and PersistentVolumeClaim..."
kubectl apply -f ~/Downloads/demo/k8s/mysql-pv-pvc.yaml

echo "Applying MySQL Deployment..."
kubectl apply -f ~/Downloads/demo/k8s/mysql-deployment.yaml

echo "Applying Jenkins Deployment..."
kubectl apply -f ~/Downloads/demo/k8s/jenkins-deployment.yaml

echo "Applying Nexus Deployment..."
kubectl apply -f ~/Downloads/demo/k8s/nexus-deployment.yaml

echo "Applying Webapp Deployment..."
kubectl apply -f ~/Downloads/demo/k8s/webapp-deployment.yaml

echo "Applying Services..."
kubectl apply -f ~/Downloads/demo/k8s/service.yaml

echo "============================================"
echo "Checking ConfigMaps..."
kubectl get configmaps

echo "Checking Deployments..."
kubectl get deployments

echo "Checking Services..."
kubectl get services

echo "Checking Pods..."
kubectl get pods

echo "============================================"
echo "All done! Cluster is up and running!"
