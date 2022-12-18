FROM ubuntu:20.04

# Provide shell a namespace it's running in.
ARG image_name
ENV DOCKER_IMAGE_NAME=${image_name}

ARG CACHE_SCHEME=http
ARG CACHE_HOST=dockerhost:9876
ADD container-env-setup.sh /tmp/container-env-setup.sh
RUN /tmp/container-env-setup.sh ${CACHE_SCHEME} ${CACHE_HOST}

RUN apt-get update