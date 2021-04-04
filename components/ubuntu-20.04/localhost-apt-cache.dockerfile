
RUN echo 'Acquire::HTTP::Proxy "http://127.0.0.1:3142";' > /etc/apt/apt.conf.d/01proxy && \
    echo 'Acquire::HTTPS::Proxy "false";' >> /etc/apt/apt.conf.d/01proxy
RUN apt-get update
