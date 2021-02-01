
ARG username=~
ENV NVM_DIR /home/${username}/.nvm

# Install latest LTS node.
# https://docs.expo.io/get-started/installation/
RUN source $NVM_DIR/nvm.sh && nvm install --lts

RUN source $NVM_DIR/nvm.sh && npm install -g yarn

# Dump node and npm information.
RUN source $NVM_DIR/nvm.sh && (echo -en "Node: " ; node -v && echo -en "NPM: " ; npm -v)
