#!/bin/bash

# TODO: Check for crazychenz/llvm-base

# Note: We're cloning and building LLVM outside of the image to
# conserve space and allow for quicker update cycles.

echo Build LLVM source code in Ubuntu container.
docker run -ti --rm -v $(pwd)/../workspace:/workspace crazychenz/llvm-base bash -c /workspace/_build_llvm.sh

CONTAINER_UUID=$(docker run -d --rm -v $(pwd)/../workspace:/workspace crazychenz/llvm-base sleep 10000000)
echo Install LLVM to docker container and commit changes to image.
docker exec -u root -ti ${CONTAINER_UUID} bash -c /workspace/_install_llvm.sh
echo Result: $?
docker commit ${CONTAINER_UUID} crazychenz/llvm-main
echo Removing docker container.
docker stop ${CONTAINER_UUID}




