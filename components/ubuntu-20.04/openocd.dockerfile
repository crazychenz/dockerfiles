
# Allow sudoers to sudo without passwords.
# Note: Recommended to use `sudo -E` in dockerfiles.
ARG OPENOCD_URL=https://github.com/xpack-dev-tools/openocd-xpack/releases/download/v0.11.0-1/
ARG OPENOCD_FNAME=xpack-openocd-0.11.0-1-linux-x64.tar.gz
RUN sudo -E apt-get install -y usbutils
RUN curl -L ${OPENOCD_URL}${OPENOCD_FNAME} -o /tmp/${OPENOCD_FNAME}
RUN sudo -E tar -C /opt -xvf /tmp/${OPENOCD_FNAME}
ENV PATH=/opt/xpack-openocd-0.11.0-1/bin:${PATH}
RUN sudo -E adduser $(whoami) root

