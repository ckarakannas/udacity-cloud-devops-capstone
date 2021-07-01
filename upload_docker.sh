#!/usr/bin/env bash

# Define dockerpath
dockerpath=chrisk14/currency-exchange:prod

# Authenticate & tag
docker login
echo "Docker ID and Image: $dockerpath"

# Push image to a docker repository
docker push $dockerpath
