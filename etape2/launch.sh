#!/bin/bash

echo "Nettoyage des containers précédents..."
docker container stop http script data 2>/dev/null || true
docker container rm http script data 2>/dev/null || true

echo "Suppression du réseau"
docker network rm tp3_network 2>/dev/null || true

echo "Création du réseau personnalisé..."
docker network create tp3_network

echo "Construction de l'image PHP avec mysqli..."
docker image build -t php:8.2-fpm-mysqli .

echo "Lancement du container MariaDB (DATA)..."
docker container run --name data --network tp3_network -e MARIADB_RANDOM_ROOT_PASSWORD=false -e MARIADB_ROOT_PASSWORD=root -v "./db:/docker-entrypoint-initdb.d" -d mariadb:latest

echo "Lancement du container PHP-FPM (SCRIPT)..."
docker container run --name script --network tp3_network -v "./src:/app" -d php:8.2-fpm-mysqli

echo "Lancement du container Nginx (HTTP)..."
docker container run --name http --network tp3_network -p 8080:80 -v "./src:/app" -v "./config/default.conf:/etc/nginx/conf.d/default.conf:ro" -d nginx:latest

