# Ubuntu 20.04 is focal.
FROM crazychenz/llvm-base

USER root

# RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

RUN wget https://apt.llvm.org/llvm.sh && \
    chmod +x llvm.sh && \
    ./llvm.sh 11

# Configure generic clang links to specific version.
RUN \
    update-alternatives --install /usr/bin/clang clang /usr/bin/clang-11 100 && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-11 100 && \
    update-alternatives --install /usr/bin/clang-cpp clang-cpp /usr/bin/clang-cpp-11 100 && \
    update-alternatives --install /usr/bin/llvm-cxxfilt llvm-cxxfilt /usr/bin/llvm-cxxfilt-11 100 && \
    update-alternatives --install /usr/bin/llvm-mt llvm-mt /usr/bin/llvm-mt-11 100 && \
    update-alternatives --install /usr/bin/llc llc /usr/bin/llc-11 100 && \
    update-alternatives --install /usr/bin/llvm-cxxmap llvm-cxxmap /usr/bin/llvm-cxxmap-11 100 && \
    update-alternatives --install /usr/bin/llvm-nm llvm-nm /usr/bin/llvm-nm-11 100 && \
    update-alternatives --install /usr/bin/lld lld /usr/bin/lld-11 100 && \
    update-alternatives --install /usr/bin/llvm-diff llvm-diff /usr/bin/llvm-diff-11 100 && \
    update-alternatives --install /usr/bin/llvm-objcopy llvm-objcopy /usr/bin/llvm-objcopy-11 100 && \
    update-alternatives --install /usr/bin/lld-link lld-link /usr/bin/lld-link-11 100 && \
    update-alternatives --install /usr/bin/llvm-dis llvm-dis /usr/bin/llvm-dis-11 100 && \
    update-alternatives --install /usr/bin/llvm-objdump llvm-objdump /usr/bin/llvm-objdump-11 100 && \
    update-alternatives --install /usr/bin/lldb lldb /usr/bin/lldb-11 100 && \
    update-alternatives --install /usr/bin/llvm-dlltool llvm-dlltool /usr/bin/llvm-dlltool-11 100 && \
    update-alternatives --install /usr/bin/llvm-opt-report llvm-opt-report /usr/bin/llvm-opt-report-11 100 && \
    update-alternatives --install /usr/bin/lldb-argdumper lldb-argdumper /usr/bin/lldb-argdumper-11 100 && \
    update-alternatives --install /usr/bin/llvm-dwarfdump llvm-dwarfdump /usr/bin/llvm-dwarfdump-11 100 && \
    update-alternatives --install /usr/bin/llvm-pdbutil llvm-pdbutil /usr/bin/llvm-pdbutil-11 100 && \
    update-alternatives --install /usr/bin/lldb-instr lldb-instr /usr/bin/lldb-instr-11 100 && \
    update-alternatives --install /usr/bin/llvm-dwp llvm-dwp /usr/bin/llvm-dwp-11 100 && \
    update-alternatives --install /usr/bin/llvm-profdata llvm-profdata /usr/bin/llvm-profdata-11 100 && \
    update-alternatives --install /usr/bin/lldb-server lldb-server /usr/bin/lldb-server-11 100 && \
    update-alternatives --install /usr/bin/llvm-elfabi llvm-elfabi /usr/bin/llvm-elfabi-11 100 && \
    update-alternatives --install /usr/bin/llvm-ranlib llvm-ranlib /usr/bin/llvm-ranlib-11 100 && \
    update-alternatives --install /usr/bin/lldb-vscode lldb-vscode /usr/bin/lldb-vscode-11 100 && \
    update-alternatives --install /usr/bin/llvm-exegesis llvm-exegesis /usr/bin/llvm-exegesis-11 100 && \
    update-alternatives --install /usr/bin/llvm-rc llvm-rc /usr/bin/llvm-rc-11 100 && \
    update-alternatives --install /usr/bin/lli lli /usr/bin/lli-11 100 && \
    update-alternatives --install /usr/bin/llvm-extract llvm-extract /usr/bin/llvm-extract-11 100 && \
    update-alternatives --install /usr/bin/llvm-readelf llvm-readelf /usr/bin/llvm-readelf-11 100 && \
    update-alternatives --install /usr/bin/lli-child-target lli-child-target /usr/bin/lli-child-target-11 100 && \
    update-alternatives --install /usr/bin/llvm-gsymutil llvm-gsymutil /usr/bin/llvm-gsymutil-11 100 && \
    update-alternatives --install /usr/bin/llvm-readobj llvm-readobj /usr/bin/llvm-readobj-11 100 && \
    update-alternatives --install /usr/bin/llvm-PerfectShuffle llvm-PerfectShuffle /usr/bin/llvm-PerfectShuffle-11 100 && \
    update-alternatives --install /usr/bin/llvm-ifs llvm-ifs /usr/bin/llvm-ifs-11 100 && \
    update-alternatives --install /usr/bin/llvm-reduce llvm-reduce /usr/bin/llvm-reduce-11 100 && \
    update-alternatives --install /usr/bin/llvm-addr2line llvm-addr2line /usr/bin/llvm-addr2line-11 100 && \
    update-alternatives --install /usr/bin/llvm-install-name-tool llvm-install-name-tool /usr/bin/llvm-install-name-tool-11 100 && \
    update-alternatives --install /usr/bin/llvm-rtdyld llvm-rtdyld /usr/bin/llvm-rtdyld-11 100 && \
    update-alternatives --install /usr/bin/llvm-ar llvm-ar /usr/bin/llvm-ar-11 100 && \
    update-alternatives --install /usr/bin/llvm-jitlink llvm-jitlink /usr/bin/llvm-jitlink-11 100 && \
    update-alternatives --install /usr/bin/llvm-size llvm-size /usr/bin/llvm-size-11 100 && \
    update-alternatives --install /usr/bin/llvm-as llvm-as /usr/bin/llvm-as-11 100 && \
    update-alternatives --install /usr/bin/llvm-lib llvm-lib /usr/bin/llvm-lib-11 100 && \
    update-alternatives --install /usr/bin/llvm-split llvm-split /usr/bin/llvm-split-11 100 && \
    update-alternatives --install /usr/bin/llvm-bcanalyzer llvm-bcanalyzer /usr/bin/llvm-bcanalyzer-11 100 && \
    update-alternatives --install /usr/bin/llvm-link llvm-link /usr/bin/llvm-link-11 100 && \
    update-alternatives --install /usr/bin/llvm-stress llvm-stress /usr/bin/llvm-stress-11 100 && \
    update-alternatives --install /usr/bin/llvm-c-test llvm-c-test /usr/bin/llvm-c-test-11 100 && \
    update-alternatives --install /usr/bin/llvm-lipo llvm-lipo /usr/bin/llvm-lipo-11 100 && \
    update-alternatives --install /usr/bin/llvm-strings llvm-strings /usr/bin/llvm-strings-11 100 && \
    update-alternatives --install /usr/bin/llvm-cat llvm-cat /usr/bin/llvm-cat-11 100 && \
    update-alternatives --install /usr/bin/llvm-lto llvm-lto /usr/bin/llvm-lto-11 100 && \
    update-alternatives --install /usr/bin/llvm-strip llvm-strip /usr/bin/llvm-strip-11 100 && \
    update-alternatives --install /usr/bin/llvm-cfi-verify llvm-cfi-verify /usr/bin/llvm-cfi-verify-11 100 && \
    update-alternatives --install /usr/bin/llvm-lto2 llvm-lto2 /usr/bin/llvm-lto2-11 100 && \
    update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer /usr/bin/llvm-symbolizer-11 100 && \
    update-alternatives --install /usr/bin/llvm-config llvm-config /usr/bin/llvm-config-11 100 && \
    update-alternatives --install /usr/bin/llvm-mc llvm-mc /usr/bin/llvm-mc-11 100 && \
    update-alternatives --install /usr/bin/llvm-tblgen llvm-tblgen /usr/bin/llvm-tblgen-11 100 && \
    update-alternatives --install /usr/bin/llvm-cov llvm-cov /usr/bin/llvm-cov-11 100 && \
    update-alternatives --install /usr/bin/llvm-mca llvm-mca /usr/bin/llvm-mca-11 100 && \
    update-alternatives --install /usr/bin/llvm-undname llvm-undname /usr/bin/llvm-undname-11 100 && \
    update-alternatives --install /usr/bin/llvm-cvtres llvm-cvtres /usr/bin/llvm-cvtres-11 100 && \
    update-alternatives --install /usr/bin/llvm-ml llvm-ml /usr/bin/llvm-ml-11 100 && \
    update-alternatives --install /usr/bin/llvm-xray llvm-xray /usr/bin/llvm-xray-11 100 && \
    update-alternatives --install /usr/bin/llvm-cxxdump llvm-cxxdump /usr/bin/llvm-cxxdump-11 100 && \
    update-alternatives --install /usr/bin/llvm-modextract llvm-modextract /usr/bin/llvm-modextract-11 100

# Configure std symlinks to use generic clang links.
# Note: Use lld-link for windows?
RUN \
    update-alternatives --install /usr/bin/cpp cpp /usr/bin/clang-cpp 100 && \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100 && \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++ 100 && \
    update-alternatives --install /usr/bin/ld ld /usr/bin/lld 100 && \
    update-alternatives --install /usr/bin/objdump objdump /usr/bin/llvm-objdump 100 && \
    update-alternatives --install /usr/bin/objcopy objcopy /usr/bin/llvm-objcopy 100 && \
    update-alternatives --install /usr/bin/ranlib ranlib /usr/bin/llvm-ranlib 100 && \
    update-alternatives --install /usr/bin/readelf readelf /usr/bin/llvm-readelf 100 && \
    update-alternatives --install /usr/bin/reduce reduce /usr/bin/llvm-reduce 100 && \
    update-alternatives --install /usr/bin/addr2line addr2line /usr/bin/llvm-addr2line 100 && \
    update-alternatives --install /usr/bin/ar ar /usr/bin/llvm-ar 100 && \
    update-alternatives --install /usr/bin/size size /usr/bin/llvm-size 100 && \
    update-alternatives --install /usr/bin/strings strings /usr/bin/llvm-strings 100 && \
    update-alternatives --install /usr/bin/strip strip /usr/bin/llvm-strip 100

ARG uid=1000
ARG gid=1000
ARG username=user
ARG groupname=user
WORKDIR /workspace
USER ${username}






