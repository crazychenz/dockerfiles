
# Allow sudoers to sudo without passwords.
# Note: Recommended to use `sudo -E` in dockerfiles.
RUN sudo apt-get install -y openocd usbutils make
