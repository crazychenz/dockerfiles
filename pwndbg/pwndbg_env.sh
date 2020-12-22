#!/bin/bash

docker run -ti --rm --cap-add=SYS_PTRACE \
    -v $(pwd):/workspace \
    crazychenz/pwndbg \
    bash -li -c "${*}"

