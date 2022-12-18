#!/bin/sh

# Build image name.
IMAGE_NS=crazychenz
IMAGE_NAME=test-pip3
IMAGE_TAG=latest
IMAGE_FULLNAME="$IMAGE_NS/$IMAGE_NAME:$IMAGE_TAG"

CACHE_SCHEME=http
CACHE_HOST=dockerhost:9876

# Fetch cache configuration script if not available.
#[ ! -f "context/container-env-setup.sh" ] && ( cd context ; wget https://raw.githubusercontent.com/user/repository/branch/filename )
# Fallback to noop if script not available.
[ ! -f "context/container-env-setup.sh" ] && ( cd context ; echo "" > container-env-setup.sh ; chmod +x container-env-setup.sh )

cat Dockerfile | docker build \
  -t ${IMAGE_FULLNAME} \
  --build-arg CACHE_SCHEME=${CACHE_SCHEME} \
  --build-arg CACHE_HOST=${CACHE_HOST} \
  --add-host dockerhost:host-gateway \
  $@ \
  -f - context
