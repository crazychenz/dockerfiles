#!/bin/sh

docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    crazychenz/ubuntu-20.04-base bash
