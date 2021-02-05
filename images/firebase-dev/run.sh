#!/bin/bash

docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    $(whoami)/firebase-dev \
    bash -li -c "${*}"

