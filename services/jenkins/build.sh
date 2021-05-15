#!/bin/sh

docker build -t crazychenz/jenkins  --build-arg DOCKER_GID=$(getent group docker | cut -d: -f3) .

