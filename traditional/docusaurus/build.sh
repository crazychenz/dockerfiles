#!/bin/sh

docker build $@ --network host --build-arg gid=$(id -g) --build-arg uid=$(id -u) --build-arg username=$(whoami) -t crazychenz/docusaurus .
