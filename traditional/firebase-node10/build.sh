#!/bin/sh

docker build --no-cache -t crazychenz/firebase-node10 .

# Recommended to volume mount /home/user from host to save login info.
# `docker cp <container>:/home/user ./home`
# `docker run -ti --rm -v $(pwd)/home:/home/user sayok/firebase-test bash`
