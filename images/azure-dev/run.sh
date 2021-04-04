#!/bin/bash

docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    $(whoami)/azure-dev \
    bash -li -c "${*}"

