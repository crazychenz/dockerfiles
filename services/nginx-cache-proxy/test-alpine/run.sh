#!/bin/sh

IMAGE_NS=crazychenz
IMAGE_NAME=test-alpine
IMAGE_TAG=latest
IMAGE_FULLNAME="$IMAGE_NS/$IMAGE_NAME:$IMAGE_TAG"

docker run --network host -ti --rm ${IMAGE_FULLNAME} $@
