#!/bin/bash

ARGS="${*}"
if [ -z "$ARGS" ]; then
    PASSED_ARGS=''
else
    PASSED_ARGS="-c \"$ARGS\""
fi

docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    $(whoami)/firebase-dev \
    bash -li $PASSED_ARGS

