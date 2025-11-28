#!/bin/bash
set -e

# ---- Hardcoded Docker Hub Credentials ----
DOCKER_USER="robbenselvaone"
DOCKER_PASS="dckr_pat_BCuPbALPEfSZQzzAdD92xO4xHX4"
REGISTRY="docker.io"
# ------------------------------------------

IMAGE=$1
export IMAGE=$IMAGE

echo "Logging in to Docker Hub..."
echo "$DOCKER_PASS" | docker login "$REGISTRY" -u "$DOCKER_USER" --password-stdin

echo "Pulling image: $IMAGE"
docker compose pull

echo "Starting containers..."
docker compose up -d

echo "Deployment completed successfully!"

