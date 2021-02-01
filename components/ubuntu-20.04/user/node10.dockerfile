
ARG username=~
ENV NVM_DIR /home/${username}/.nvm

# Install LTS node for Google Spark Plan.
RUN source $NVM_DIR/nvm.sh && nvm install 10.23.0

#RUN source $NVM_DIR/nvm.sh && npm install -g yalc

# Dump node and npm information.
RUN source $NVM_DIR/nvm.sh && (echo -en "Node: " ; node -v && echo -en "NPM: " ; npm -v)
