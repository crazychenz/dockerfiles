#!/bin/sh

docker run \
    --name apt-cacher-ng \
    --network host \
    --init -d --restart=always --rm \
    --publish 3142:3142 \
    --volume /srv/docker/apt-cacher-ng:/var/cache/apt-cacher-ng \
    $(whoami)/apt-cacher-ng


# SELinux users should update the security context of the host mountpoint so that it plays nicely with Docker:
# 
# mkdir -p /srv/docker/apt-cacher-ng
# chcon -Rt svirt_sandbox_file_t /srv/docker/apt-cacher-ng
