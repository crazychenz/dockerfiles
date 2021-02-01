#!/bin/sh

./Dockerfile.sh | docker build \
    -t crazychenz/ubuntu-20.04-base \
    --build-arg username=$(whoami) \
    --build-arg uid=$(id -u) \
    --build-arg gid=$(id -g) \
    --build-arg groupname=$(id -gn) \
    -f - .

# Recommended to volume mount /home/user from host to save login info.
# `docker cp <container>:/home/user ./home`
# `docker run -ti --rm -v $(pwd)/home:/home/user sayok/firebase-test bash`
