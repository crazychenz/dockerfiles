#!/bin/sh

docker exec -it apt-cacher-ng tail -f /var/log/apt-cacher-ng/apt-cacher.log
