# set the base image to Debian
# https://hub.docker.com/_/debian/
FROM ubuntu:latest

# replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# update the repository sources list
# and install dependencies
RUN apt-get update \
    && apt-get install -y net-tools curl python3 \
    && apt-get -y autoclean

# (High maintenance) node-gyp needs python, make, and a toolchain
# https://www.npmjs.com/package/node-gyp
RUN apt-get install -y build-essential

WORKDIR /workspace
RUN adduser -u 1000 user
USER user

# install nvm
# https://github.com/creationix/nvm#install-script

ENV NVM_DIR /home/user/.nvm
ENV NVM_VERSION 0.37.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash

# Note: This docker image is intended to be a base image for other
# docker images that have a specific node environment installed.

# Example Dockerfile:
#
#    # set the base image to Debian
#    # https://hub.docker.com/_/debian/
#    FROM crazychenz/nvm
#
#    # These were values used in crazychenz/nvm
#    WORKDIR /workspace
#    USER user
#    ENV NVM_DIR /home/user/.nvm
#
#    # Install latest LTS node.
#    # https://docs.expo.io/get-started/installation/
#    RUN source $NVM_DIR/nvm.sh && nvm install --lts
#
#    RUN source $NVM_DIR/nvm.sh && npm install -g yarn
#
#    # Dump node and npm information.
#    RUN source $NVM_DIR/nvm.sh && (echo -en "Node: " ; node -v && echo -en "NPM: " ; npm -v)



