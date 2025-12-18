#!/bin/bash

echo "Nettoyage des containers précédents..."
docker container stop http script 2>/dev/null || true
docker container rm http script 2>/dev/null || true

echo "Création du réseau personnalisé..."
docker network create tp3_network 2>/dev/null || true

echo "Lancement du container PHP-FPM (SCRIPT)..."
docker container run --name script --network tp3_network -v "./src:/app" -d php:8.2-fpm

echo "Lancement du container Nginx (HTTP)..."
docker container run --name http --network tp3_network -p 8080:80 -v "./src:/app" -v "./config/default.conf:/etc/nginx/conf.d/default.conf:ro" -d nginx:latest
