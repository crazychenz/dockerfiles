# TODO: This should probably all be moved into install script.
# TODO: This is really only left here so that we can maintain the PATH.

# set default environment variables
ENV CLITOOLS_SDK_FNAME=commandlinetools-linux-6609375_latest.zip
ENV ANDROID_BUILD_VERSION=28
ENV ANDROID_TOOLS_VERSION=28.0.3
ENV NDK_VERSION=20.1.5948944
ENV ADB_INSTALL_TIMEOUT=10
ENV ANDROID_HOME=/home/${username}/android
ENV ANDROID_SDK_HOME=${ANDROID_HOME}
ENV ANDROID_NDK=${ANDROID_HOME}/ndk/$NDK_VERSION

ENV PATH=${ANDROID_NDK}:${ANDROID_HOME}/cmdline-tools/tools/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:/opt/buck/bin/:${PATH}

RUN sudo -E apt-get install -y curl unzip openjdk-8-jdk-headless

# # Install system dependencies
# RUN sudo -E apt-get update -qq && apt-get install -qq -y --no-install-recommends \
#         apt-transport-https \
#         curl \
#         file \
#         gcc \
#         git \
#         g++ \
#         gnupg2 \
#         libc++1-10 \
#         libgl1 \
#         libtcmalloc-minimal4 \
#         make \
#         openjdk-8-jdk-headless \
#         openssh-client \
#         python3 \
#         python3-distutils \
#         rsync \
#         ruby \
#         ruby-dev \
#         tzdata \
#         unzip \
#         zip \
#     && apt-get -y clean

# install nodejs and yarn packages from nodesource and yarn apt sources
# RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash - \
#     && echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list \
#     && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#     && apt-get update -qq \
#     && apt-get install -qq -y --no-install-recommends nodejs yarn \
#     && rm -rf /var/lib/apt/lists/*

# # Full reference at https://dl.google.com/android/repository/repository2-1.xml
# # download and unpack android
# RUN curl -sS https://dl.google.com/android/repository/${CLITOOLS_SDK_FNAME} -o /tmp/sdk.zip \
#     && mkdir -p ${ANDROID_HOME}/cmdline-tools \
#     && unzip -q -d ${ANDROID_HOME}/cmdline-tools /tmp/sdk.zip \
#     && rm /tmp/sdk.zip \
#     && yes | sdkmanager --licenses \
#     && yes | sdkmanager "platform-tools" \
#         "emulator" \
#         "platforms;android-$ANDROID_BUILD_VERSION" \
#         "build-tools;$ANDROID_TOOLS_VERSION" \
#         "cmake;3.10.2.4988404" \
#         "system-images;android-21;google_apis;armeabi-v7a" \
#         "ndk;$NDK_VERSION" \
#     && rm -rf ${ANDROID_HOME}/.android

# From: "Unable to initialize metrics, ensure /opt/android is writable"
# RUN chmod 777 /opt/android




