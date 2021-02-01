#!/bin/sh

docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    $(whoami)/ubuntu-20.04-base bash
