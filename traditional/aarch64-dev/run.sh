#!/bin/bash

docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    crazychenz/aarch64-dev \
    bash -li -c "${*}"

