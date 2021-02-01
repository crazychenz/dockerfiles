# Build the base pwndbg container:
# git clone https://github.com/pwndbg/pwndbg
# Look at instructions on pwndbg/Dockerfile
# Note: This was last tested with commit: f74aa34c
FROM pwndbg

# some sanity utilities
RUN apt-get install -y gdb-multiarch net-tools wget curl apt-utils netcat socat \
    crossbuild-essential-armel

# Could crossbuild-essential-armel be smaller? Perhaps only:
#    libc6-armel-cross
#    libc6-dev-armel-cross
#    libgcc-s1-armel-cross
#    libstdc++-8-dev-armel-cross
#    linux-libc-dev-armel-cross

# pwndbg complains when we don't use UTF-8 as our locale
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# prefer to always run container as user
ARG uid=1000
ARG gid=1000
ARG username=user
ARG groupname=user
WORKDIR /workspace
RUN addgroup --system --gid ${gid} ${groupname}
RUN adduser --system --disabled-password --uid ${uid} --gid ${gid} ${username}
RUN cp /root/.gdbinit* /home/${username}/ && chown ${username} /home/${username}/.gdbinit*
USER ${username}