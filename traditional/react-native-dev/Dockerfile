FROM ubuntu:20.04

# Most things (e.g. bash) are better than /bin/sh.
# Note: This tricks `docker build` into using bash instead of
#       the dorked /bin/sh that is part of ubuntu base image.
# Note: This should be done first so all subsequent environment
#       settings are part of this new shell environment.
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ARG DEBIAN_FRONTEND=noninteractive

# Provide shell a namespace it's running in.
ENV DOCKER_IMAGE_NAME=react-native-dev

# Prompts without color should be the edge case.
ENV TERM=xterm-256color

# Break that absurd bell!
RUN echo "set bell-style none" >> /etc/inputrc

RUN rm -rf /etc/apt/sources.list /var/lib/apt/lists/*
ADD imports/sources.list /etc/apt/sources.list

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

# Install node 14 (lts) from nodesource
RUN curl -fsSL https://deb.nodesource.com/setup_14.x \
    | sudo bash -

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg \
    | gpg --dearmor \
    | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" \
    | sudo tee /etc/apt/sources.list.d/yarn.list
RUN sudo apt-get update && sudo apt-get install -y nodejs gcc g++ make yarn
RUN echo 'registry "http://127.0.0.1:3081/repository/yarn/"' > ~/.yarnrc
RUN yarn global add expo-cli


ARG BUCK_VERSION=2020.10.21.01

# Buck .deb dependencies
RUN sudo apt-get install -y \
    openjdk-8-jre-headless \
    python3-distutils

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# download and install buck using debian package
# TODO: Cache locally.
RUN curl -sS -L https://github.com/facebook/buck/releases/download/v${BUCK_VERSION}/buck.${BUCK_VERSION}_all.deb -o /tmp/buck.deb \
    && sudo dpkg -i /tmp/buck.deb \
    && rm /tmp/buck.deb
# TODO: This should probably all be moved into install script.
# TODO: This is really only left here so that we can maintain the PATH.

# set default environment variables
ENV CLITOOLS_SDK_FNAME=commandlinetools-linux-6609375_latest.zip
ENV ANDROID_BUILD_VERSION=28
ENV ANDROID_TOOLS_VERSION=28.0.3
ENV NDK_VERSION=20.1.5948944
ENV ADB_INSTALL_TIMEOUT=10
ENV ANDROID_HOME=/opt/android
ENV ANDROID_SDK_HOME=${ANDROID_HOME}
ENV ANDROID_NDK=${ANDROID_HOME}/ndk/$NDK_VERSION

ENV PATH=${ANDROID_NDK}:${ANDROID_HOME}/cmdline-tools/tools/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:/opt/buck/bin/:${PATH}

RUN sudo apt-get install -y unzip openjdk-8-jdk-headless
RUN sudo mkdir -p ${ANDROID_HOME}
RUN sudo chown ${username}:${groupname} ${ANDROID_HOME}

# Full reference at https://dl.google.com/android/repository/repository2-1.xml
# download and unpack android
RUN curl -sS https://dl.google.com/android/repository/${CLITOOLS_SDK_FNAME} -o /tmp/sdk.zip \
    && mkdir -p ${ANDROID_HOME}/cmdline-tools \
    && unzip -q -d ${ANDROID_HOME}/cmdline-tools /tmp/sdk.zip \
    && rm /tmp/sdk.zip \
    && yes | sdkmanager --licenses \
    && yes | sdkmanager "platform-tools" \
        "platforms;android-$ANDROID_BUILD_VERSION" \
        "build-tools;$ANDROID_TOOLS_VERSION" \
        "cmake;3.10.2.4988404" \
        "ndk;$NDK_VERSION" \
    && rm -rf ${ANDROID_HOME}/.android

# From: "Unable to initialize metrics, ensure /opt/android is writable"
RUN chmod 777 /opt/android

WORKDIR /workspace