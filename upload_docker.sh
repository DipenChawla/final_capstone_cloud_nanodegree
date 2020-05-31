#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
VERSION=1.0
echo "Current version : $VERSION"
read -p "Enter the version: "
if [[ "$REPLY" != "" ]]
then
    VERSION=$REPLY
fi
dockerpath=dipenc/udacity-capstone:$VERSION

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker login
docker push $dockerpath
if [ $? -ne 0 ]; then
    echo "Image does not exist..."
    echo "Trying to build"
    docker build -t $dockerpath .
    echo "pushing again"
    docker push $dockerpath
fi