#!/bin/bash

# Build initial image
docker build \
    --build-arg uid=$(id -u) \
    --build-arg username=$(whoami) \
    --build-arg gid=$(id -g) \
    --build-arg groupname=$(whoami) \
    -t crazychenz/llvm-base .






