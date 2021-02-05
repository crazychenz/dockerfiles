#!/bin/bash

if [ "$#" -lt "2" ]; then
    echo $#
    echo "Usage: $0 $(whoami)/<image> <path>"
    exit 1
fi

CONTAINER_ID=$(docker run -dti --rm "$(whoami)/$1" sleep 100000)
if [ "$?" -eq "0" ]; then
    pushd "$2"
    docker cp $CONTAINER_ID:/home/$(whoami) .
    popd
    docker stop $CONTAINER_ID
fi
