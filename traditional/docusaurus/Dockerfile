FROM debian:buster-slim
#FROM ubuntu:20.04

# Most things (e.g. bash) are better than /bin/sh.
# Note: This tricks `docker build` into using bash instead of
#       the dorked /bin/sh that is part of ubuntu base image.
# Note: This should be done first so all subsequent environment
#       settings are part of this new shell environment.
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ARG DEBIAN_FRONTEND=noninteractive

# Provide shell a namespace it's running in.
ENV DOCKER_IMAGE_NAME=docusaurus

# Prompts without color should be the edge case.
ENV TERM=screen-256color

# Break that absurd bell!
RUN echo "set bell-style none" >> /etc/inputrc

#RUN rm -rf /etc/apt/sources.list /var/lib/apt/lists/*
#ADD imports/sources.list /etc/apt/sources.list

# Update repository list and install baseline dependencies.
RUN apt-get update && apt-get install -y \
    net-tools iputils-ping \
    curl wget \
    python3 \
    vim vim-common \
    rsync \
    git \
    openssh-client telnet \
    && apt-get -y autoclean

RUN apt-get install -y \
    build-essential 

RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
# Uncommon this line if running on arm64.
#RUN dpkg --add-architecture armhf
RUN apt-get update && apt-get install -y nodejs

RUN npm install -g @docusaurus/init yarn

# Allow sudoers to sudo without passwords.
# Note: Recommended to use `sudo -E` in dockerfiles.
RUN apt-get install -y sudo
RUN sed -i 's/ALL=(ALL:ALL) ALL/ALL=(ALL:ALL) NOPASSWD: ALL/' /etc/sudoers

# RUN echo 'Acquire::HTTP::Proxy "http://127.0.0.1:3142";' > /etc/apt/apt.conf.d/01proxy && \
#     echo 'Acquire::HTTPS::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy

# User defaults, ideally setup to match existing user's info with `whoami` and `id`.
ARG uid=1000
ARG gid=1000
ARG username=user
ARG groupname=user

RUN addgroup --gid ${gid} ${groupname}
RUN adduser --system --disabled-password --uid ${uid} --gid ${gid} ${username}
RUN adduser ${username} sudo
USER ${username}

RUN rsync -rv /etc/skel/ /home/${username}/
RUN echo "alias sudo='sudo -E'" >> /home/${username}/.bashrc

ADD imports/bash-user-settings.sh /home/${username}/.bash-user-settings.sh
RUN echo source ~/.bash-user-settings.sh >> /home/${username}/.bashrc

WORKDIR /workspace
