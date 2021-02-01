
RUN echo 'Acquire::HTTP::Proxy "http://192.168.1.22:3142";' > /etc/apt/apt.conf.d/01proxy && \
    echo 'Acquire::HTTPS::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy
RUN apt-get update
