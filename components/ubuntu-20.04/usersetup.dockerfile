
# User defaults, ideally setup to match existing user's info with `whoami` and `id`.
ARG uid=1000
ARG gid=1000
ARG username=user
ARG groupname=user

RUN addgroup --gid ${gid} ${groupname}
RUN adduser --system --disabled-password --uid ${uid} --gid ${gid} ${username}
RUN adduser ${username} sudo
USER ${username}

RUN rsync -rv /etc/skel/ /home/${username}/
RUN echo alias sudo=\'sudo -E\' >> /home/${username}/.bashrc

ADD imports/docker-user-settings.sh /home/${username}/.docker-user-settings.sh
RUN echo source ~/.docker-user-settings.sh >> /home/${username}/.bashrc