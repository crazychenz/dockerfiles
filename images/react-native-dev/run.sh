#!/bin/bash -x

[ ! -v HOME_VOLMAP ] && HOME_VOLMAP="-v $(pwd)/home/$(whoami):/home/$(whoami)"

docker run \
    -ti --rm \
    --network host \
    $HOME_VOLMAP \
    -v $(pwd):/workspace \
    $(whoami)/react-native-dev \
    $([ "$#" -eq "0" ] && echo 'bash -li') "$@"
