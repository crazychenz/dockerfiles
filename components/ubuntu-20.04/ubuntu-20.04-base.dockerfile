FROM ubuntu:20.04

# Most things (e.g. bash) are better than /bin/sh.
# Note: This tricks `docker build` into using bash instead of
#       the dorked /bin/sh that is part of ubuntu base image.
# Note: This should be done first so all subsequent environment
#       settings are part of this new shell environment.
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ARG DEBIAN_FRONTEND=noninteractive

# Provide shell a namespace it's running in.
ENV DOCKER_IMAGE_NAME=DOCKER_IMAGE_NAME_VALUE

# Prompts without color should be the edge case.
ENV TERM=xterm-256color

# Update repository list and install baseline dependencies.
RUN apt-get update && apt-get install -y \
    net-tools \
    curl wget \
    python3 \
    vim vim-common \
    rsync \
    git \
    && apt-get -y autoclean

