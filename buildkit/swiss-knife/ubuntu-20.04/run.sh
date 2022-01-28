#!/bin/bash

CMD_PREFIX="docker run \
    -ti --rm \
    --network host \
    -v $(pwd):/workspace \
    crazychenz/swiss-knife:ubuntu-20.04"
   
if [ $# -gt 0 ]; then
  $CMD_PREFIX bash -li -c "${*}"
else
  $CMD_PREFIX bash -li
fi

