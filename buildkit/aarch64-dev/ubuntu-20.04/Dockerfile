FROM localhost:5000/crazychenz/swiss-knife:ubuntu-20.04

USER root

ARG DEBIAN_FRONTEND=noninteractive
ENV DOCKER_IMAGE_NAME=aarch64-dev

RUN apt-get update && apt-get install -y \
    build-essential \
    flex bison \
    libssl-dev \
    crossbuild-essential-arm64 \
    libncurses5-dev \
    bc \
    cpio \
    fakeroot \
    vim vim-common \
    qemu-user-static \
    qemu-system-arm

RUN apt-get install -y \
    binwalk

ARG username=user
USER ${username}

