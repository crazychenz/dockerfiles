#!/bin/sh

export DOCKER_BUILDKIT=1
docker build -t crazychenz/firebase-node10 .
CONT=$(docker run -d --rm -v /projects/stable/sayok-ws/home/user:/home/user crazychenz/firebase-node10 sleep 100000)
docker exec -ti $CONT /bin/bash -li -c "source /home/user/.nvm/nvm.sh && npm install -g yarn yalc"
docker commit $CONT
docker stop $CONT

# Recommended to volume mount /home/user from host to save login info.
# `docker cp <container>:/home/user ./home`
# `docker run -ti --rm -v $(pwd)/home:/home/user sayok/firebase-test bash`
