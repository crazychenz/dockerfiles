# Ubuntu 20.04 is focal.
FROM crazychenz/llvm-main

USER root

# libc6-dev: /usr/include/x86_64-linux-gnu/bits/libc-header-start.h
# libc6-dev-amd64-cross: /usr/x86_64-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-arm64-cross: /usr/aarch64-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-armel-cross: /usr/arm-linux-gnueabi/include/bits/libc-header-start.h
# libc6-dev-armhf-cross: /usr/arm-linux-gnueabihf/include/bits/libc-header-start.h
# libc6-dev-hppa-cross: /usr/hppa-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-i386-cross: /usr/i686-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-m68k-cross: /usr/m68k-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-mips-cross: /usr/mips-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-mips64-cross: /usr/mips64-linux-gnuabi64/include/bits/libc-header-start.h
# libc6-dev-mips64el-cross: /usr/mips64el-linux-gnuabi64/include/bits/libc-header-start.h
# libc6-dev-mips64r6-cross: /usr/mipsisa64r6-linux-gnuabi64/include/bits/libc-header-start.h
# libc6-dev-mips64r6el-cross: /usr/mipsisa64r6el-linux-gnuabi64/include/bits/libc-header-start.h
# libc6-dev-mipsel-cross: /usr/mipsel-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-mipsn32-cross: /usr/mips64-linux-gnuabin32/include/bits/libc-header-start.h
# libc6-dev-mipsn32el-cross: /usr/mips64el-linux-gnuabin32/include/bits/libc-header-start.h
# libc6-dev-mipsn32r6-cross: /usr/mipsisa64r6-linux-gnuabin32/include/bits/libc-header-start.h
# libc6-dev-mipsn32r6el-cross: /usr/mipsisa64r6el-linux-gnuabin32/include/bits/libc-header-start.h
# libc6-dev-mipsr6-cross: /usr/mipsisa32r6-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-mipsr6el-cross: /usr/mipsisa32r6el-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-powerpc-cross: /usr/powerpc-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-ppc64-cross: /usr/powerpc64-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-ppc64el-cross: /usr/powerpc64le-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-riscv64-cross: /usr/riscv64-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-s390x-cross: /usr/s390x-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-sh4-cross: /usr/sh4-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-sparc64-cross: /usr/sparc64-linux-gnu/include/bits/libc-header-start.h
# libc6-dev-x32-cross: /usr/x86_64-linux-gnux32/include/bits/libc-header-start.h
# libc6.1-dev-alpha-cross: /usr/alpha-linux-gnu/include/bits/libc-header-start.h

# libgcc-10-dev-arm64-cross: /usr/lib/gcc-cross/aarch64-linux-gnu/10/libgcc.a                                                │········
# libgcc-10-dev-armel-cross: /usr/lib/gcc-cross/arm-linux-gnueabi/10/libgcc.a                                                │········
# libgcc-10-dev-armhf-cross: /usr/lib/gcc-cross/arm-linux-gnueabihf/10/libgcc.a

#RUN apt-get install -y \
#    libc6-dev-armel-cross libc6-dev-arm64-cross libc6-dev-armhf-cross \
#    libgcc-10-dev-armel-cross libgcc-10-dev-arm64-cross libgcc-10-dev-armhf-cross

#
# clang vuln.c -o vuln --target=aarch64-linux-gnu -fuse-ld=lld -Wl,-L/usr/lib/gcc-cross/aarch64-linux-gnu/10/

RUN apt-get install -y crossbuild-essential-armhf crossbuild-essential-arm64 crossbuild-essential-armel
# clang vuln.c -o vuln --target=arm-linux-gnueabi -isystem /usr/arm-linux-gnueabi/include -fuse-ld=lld -v
# sudo apt install libpython3-dev:armhf libncurses5-dev:armhf libxml2-dev:armhf libedit-dev:armhf

ARG uid=1000
ARG gid=1000
ARG username=user
ARG groupname=user
WORKDIR /workspace
USER ${username}






