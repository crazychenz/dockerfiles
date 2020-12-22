# Ubuntu 20.04 is focal.
FROM ubuntu:focal

RUN apt-get update && \
  apt-get install -y net-tools lsb-release wget curl apt-utils software-properties-common

RUN apt-get install -y ninja-build make cmake git build-essential python3-distutils

ARG uid=1000
ARG gid=1000
ARG username=user
ARG groupname=user
WORKDIR /workspace
RUN addgroup --system --gid ${gid} ${groupname}
RUN adduser --system --disabled-password --uid ${uid} --gid ${gid} ${username}
USER ${username}