#!/bin/sh

IMAGE_NS=crazychenz
IMAGE_NAME=test-ubuntu-20.04
IMAGE_TAG=latest
IMAGE_FULLNAME="$IMAGE_NS/$IMAGE_NAME:$IMAGE_TAG"

docker run --network host -ti --rm ${IMAGE_FULLNAME} $@
