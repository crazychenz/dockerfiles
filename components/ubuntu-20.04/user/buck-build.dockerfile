
ARG BUCK_VERSION=2020.10.21.01

# Buck .deb dependencies
RUN sudo -E apt-get install -y \
    curl openjdk-8-jre-headless python3-distutils

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# download and install buck using debian package
# TODO: Cache locally.
RUN curl -sS -L https://github.com/facebook/buck/releases/download/v${BUCK_VERSION}/buck.${BUCK_VERSION}_all.deb -o /tmp/buck.deb \
    && sudo -E dpkg -i /tmp/buck.deb \
    && rm /tmp/buck.deb
