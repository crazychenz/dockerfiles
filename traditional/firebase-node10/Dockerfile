# set the base image to Debian
# https://hub.docker.com/_/debian/
FROM crazychenz/nvm

USER root
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq openjdk-14-jre

# These were values used in sayok/nvm
WORKDIR /workspace
USER user
ENV NVM_DIR /home/user/.nvm

# Install LTS node for Google Spark Plan.
RUN source $NVM_DIR/nvm.sh && nvm install 10.23.0

RUN source $NVM_DIR/nvm.sh && npm install -g yarn

# Dump node and npm information.
RUN source $NVM_DIR/nvm.sh && (echo -en "Node: " ; node -v && echo -en "NPM: " ; npm -v)

# Need to set default shell to get nvm settings from .bashrc
SHELL ["/bin/bash", "-c"]
