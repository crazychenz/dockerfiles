#!/bin/sh

# Configuration
T=../..
C=$T/components
IMAGE_NAME=openocd-dev

# Context Setup
mkdir imports
cp $T/configs/bash-user-settings.sh imports/

# System Initialization
sed "s/DOCKER_IMAGE_NAME_VALUE/$IMAGE_NAME/" $C/ubuntu-20.04/ubuntu-20.04-base.dockerfile
cat $C/ubuntu-20.04/sudo.dockerfile
cat $C/ubuntu-20.04/localhost-apt-cache.dockerfile

cat $C/ubuntu-20.04/gdb.dockerfile

echo "ADD minirc.usb0 /etc/minicom/minirc.usb0"
echo "ADD minirc.usb1 /etc/minicom/minirc.usb1"

# User Setup
cat $C/ubuntu-20.04/usersetup.dockerfile

    cat $C/ubuntu-20.04/user/minicom.dockerfile

    # Application Setup (as user)
    cat $C/ubuntu-20.04/openocd.dockerfile

    # Finalization (as user)
    cat $C/ubuntu-20.04/workspace.dockerfile

# Obligatory newline
echo
