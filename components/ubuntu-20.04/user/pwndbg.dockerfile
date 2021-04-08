
ARG DEBIAN_FRONTEND=noninteractive

# As root
RUN sudo -E apt-get install -y \
    libglib2.0-dev \
    libc6-dbg \
    gdb-multiarch \
    python3-dev \
    python3-pip \
    python3-setuptools \
    zlib1g-dev \
    git \
    unzip

RUN sudo -E /usr/bin/python3.8 -m pip install \
    --target /usr/local/lib/python3.8/dist-packages -U \
    future \
    'isort!=4.3.0' \
    pip \
    'psutil>=3.1.0' \
    pycparser \
    pyelftools \
    'python-ptrace>=0.8' \
    ROPgadget \
    six \
    'unicorn>=1.0.0' \
    pygments \
    'capstone==4.0.1' \
    enum34 \
    pytest \
    testresources

# As user
ADD imports/pwndbg-2020.07.23.zip /home/$username/pwndbg-2020.07.23.zip
RUN sudo -E chown -R $username /home/$username
RUN cd /home/$username && unzip /home/$username/pwndbg-2020.07.23.zip
RUN echo "source /home/$username/pwndbg-2020.07.23/gdbinit.py" >> /home/$username/.gdbinit

RUN sudo -E apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
   

# TODO: Add radare2/rizin integration here.