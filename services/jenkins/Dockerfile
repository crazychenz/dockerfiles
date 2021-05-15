FROM jenkins/jenkins:lts
ARG DOCKER_GID=1
USER root
RUN groupadd -g $DOCKER_GID docker
RUN usermod -aG docker jenkins
RUN apt-get update && \
    apt-get install -y sudo docker-compose
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
#RUN pip3 install docker-compose

USER jenkins
