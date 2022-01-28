#!/bin/sh

IMAGE_HOST="localhost:5000/"
IMAGE_NS=crazychenz
IMAGE_NAME=aarch64-dev
IMAGE_TAG=ubuntu-20.04

BUILDER_NAME="$IMAGE_NS__$IMAGE_NAME-builder__$IMAGE_TAG"

# Check if builder exist
docker buildx inspect $BUILDER_NAME >/dev/null 2>/dev/null
if [ "$?" != "0" ]; then
  docker buildx create \
    --config buildkitd.toml \
    --driver docker-container \
    --driver-opt network=host \
    --name "$BUILDER_NAME" \
    --use
  echo "Created builder $BUILDER_NAME"
else
  echo "Using existing builder $BUILDER_NAME"
fi

cat Dockerfile | docker buildx build \
  --builder $BUILDER_NAME --load \
  --network host \
  --build-arg image_name="$IMAGE_NAME" \
  -t "$IMAGE_HOST$IMAGE_NS/$IMAGE_NAME:$IMAGE_TAG" -f - . \
  && echo "Created image $IMAGE_NS/$IMAGE_NAME:$IMAGE_TAG"

#docker buildx rm "$BUILDER_NAME"
#echo "Removed builder $BUILDER_NAME"
