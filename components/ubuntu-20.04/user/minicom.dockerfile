
RUN sudo apt-get install -y minicom
RUN sudo adduser $(whoami) dialout
RUN sudo adduser $(whoami) plugdev

# TODO: Add pwndbg/radare2/rizin integration here.
