#!/bin/bash

docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    crazychenz/docfx \
    bash -li -c "${*}"

