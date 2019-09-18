#!/bin/bash

# Stop the container if running
if [ "$(docker ps | grep -c nneft)" -ne 0 ]
then
  docker stop nneft
fi

# Delete the container if existing
if [ "$(docker container ls -a | grep -c nneft)" -ne 0 ]
then
  docker rm nneft
fi

# Rebuild the image and create a container
docker build --no-cache -t ipat/nneft .
docker run -p 8890:8888 -v /nneft:/home/jovyan/jupyter --name nneft ipat/nneft /app/startup.sh
