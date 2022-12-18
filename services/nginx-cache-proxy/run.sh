#!/bin/bash

mkdir -p nginx/log
mkdir -p nginx/cache/tmp/{alpine,redhat,centos,debian,ubuntu,pypi,npm,yarn}
mkdir -p nginx/cache/{alpine,redhat,centos,debian,ubuntu,pypi,npm,yarn}


docker run -ti --rm \
  -v $(pwd)/nginx/cache:/opt/nginx/cache \
  -v $(pwd)/nginx/etc/nginx.conf:/etc/nginx/nginx.conf \
  -v $(pwd)/nginx/log:/var/log/nginx \
  -p 9876:80 \
  crazychenz/nginx-cache-proxy $@
