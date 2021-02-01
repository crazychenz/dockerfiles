
ARG username=~

# (High maintenance) node-gyp needs python, make, and a toolchain
# https://www.npmjs.com/package/node-gyp
RUN sudo -E apt-get install -y build-essential

# install nvm
# https://github.com/creationix/nvm#install-script

ENV NVM_DIR /home/${username}/.nvm
ENV NVM_VERSION 0.37.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash
