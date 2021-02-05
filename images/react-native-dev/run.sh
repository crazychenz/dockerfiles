#!/bin/bash

docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    $(whoami)/react-native-dev \
    bash -li -c "${*}"
