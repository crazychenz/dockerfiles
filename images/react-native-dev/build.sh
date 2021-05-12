#!/bin/bash

DOTENV=${DOTENV:-default.env}
echo $DOTENV
source $(realpath $DOTENV)

FINAL_TAG_NAME=$FINAL_TAG_NAME
TEMP_TAG_NAME=$FINAL_TAG_NAME-$(date +%Y%m%d-%H%M%S)

# 1. Generate Dockerfile from Dockerfile.sh
# 2. Attempt to build the docker image
# 3. Rename built docker image to usable name
# 4. Remove the temporal image name
./Dockerfile.sh | docker build \
    -t $TEMP_TAG_NAME \
    --network host \
    ${*} \
    --build-arg username=$CURRENT_USERNAME \
    --build-arg uid=$CURRENT_UID \
    --build-arg gid=$CURRENT_GID \
    --build-arg groupname=$CURRENT_GROUPNAME \
    -f - . && \
    docker tag ${TEMP_TAG_NAME} ${FINAL_TAG_NAME} && \
    docker rmi ${TEMP_TAG_NAME}

# Clear any dangling images.
#docker rmi $(docker images -f dangling=true -q)

# Recommended to volume mount /home/user from host to save login info.
# `docker cp <container>:/home/user ./home`
# `docker run -ti --rm -v $(pwd)/home:/home/user sayok/firebase-test bash`
