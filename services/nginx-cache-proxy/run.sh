#!/bin/bash

./setup-env.sh

docker run -ti --rm \
  -v $(pwd)/nginx/cache:/opt/nginx/cache \
  -v $(pwd)/nginx/etc/nginx.conf:/etc/nginx/nginx.conf \
  -v $(pwd)/nginx/log:/var/log/nginx \
  -p 9876:80 \
  crazychenz/nginx-cache-proxy $@
