#!/bin/sh

# Configuration
T=../..
C=$T/components
IMAGE_NAME=react-native-dev

# Context Setup
mkdir imports
cp $T/configs/bash-user-settings.sh imports/

# System Initialization
sed "s/DOCKER_IMAGE_NAME_VALUE/$IMAGE_NAME/" $C/ubuntu-20.04/ubuntu-20.04-base.dockerfile
cat $C/ubuntu-20.04/sudo.dockerfile
cat $C/ubuntu-20.04/localhost-apt-cache.dockerfile

# User Setup
cat $C/ubuntu-20.04/usersetup.dockerfile

    # Application Setup (as user)
    cat $C/ubuntu-20.04/user/nvm.dockerfile
    cat $C/ubuntu-20.04/user/node-lts.dockerfile

    cat $C/ubuntu-20.04/user/buck-build.dockerfile
    cat $C/ubuntu-20.04/user/android-sdk.dockerfile

    #echo "RUN sudo -E apt-get install -y openjdk-14-jre openjdk-14-jdk"

    # Finalization (as user)
    cat $C/ubuntu-20.04/workspace.dockerfile

# Obligatory newline
echo
