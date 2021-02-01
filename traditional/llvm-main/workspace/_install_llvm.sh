#!/bin/bash

if [ ! -d "/workspace/llvm-build" ] 
then
  echo "ERROR: Must run _build_llvm.sh first."
  exit 1
fi

# Run the build
cd /workspace/llvm-build
cmake --build . --target install

LLVM_PREFIX=/opt/llvm-main/
update-alternatives --install /usr/bin/clang clang ${LLVM_PREFIX}bin/clang 100 && \
update-alternatives --install /usr/bin/clang++ clang++ ${LLVM_PREFIX}bin/clang++ 100 && \
update-alternatives --install /usr/bin/clang-cpp clang-cpp ${LLVM_PREFIX}bin/clang-cpp 100 && \
update-alternatives --install /usr/bin/llvm-cxxfilt llvm-cxxfilt ${LLVM_PREFIX}bin/llvm-cxxfilt 100 && \
update-alternatives --install /usr/bin/llvm-mt llvm-mt ${LLVM_PREFIX}bin/llvm-mt 100 && \
update-alternatives --install /usr/bin/llc llc ${LLVM_PREFIX}bin/llc 100 && \
update-alternatives --install /usr/bin/llvm-cxxmap llvm-cxxmap ${LLVM_PREFIX}bin/llvm-cxxmap 100 && \
update-alternatives --install /usr/bin/llvm-nm llvm-nm ${LLVM_PREFIX}bin/llvm-nm 100 && \
update-alternatives --install /usr/bin/lld lld ${LLVM_PREFIX}bin/lld 100 && \
update-alternatives --install /usr/bin/ld.lld ld.lld ${LLVM_PREFIX}bin/ld.lld 100 && \
update-alternatives --install /usr/bin/lld-link lld-link ${LLVM_PREFIX}bin/lld-link 100 && \
update-alternatives --install /usr/bin/llvm-diff llvm-diff ${LLVM_PREFIX}bin/llvm-diff 100 && \
update-alternatives --install /usr/bin/llvm-objcopy llvm-objcopy ${LLVM_PREFIX}bin/llvm-objcopy 100 && \
update-alternatives --install /usr/bin/lld-link lld-link ${LLVM_PREFIX}bin/lld-link 100 && \
update-alternatives --install /usr/bin/llvm-dis llvm-dis ${LLVM_PREFIX}bin/llvm-dis 100 && \
update-alternatives --install /usr/bin/llvm-objdump llvm-objdump ${LLVM_PREFIX}bin/llvm-objdump 100 && \
update-alternatives --install /usr/bin/lldb lldb ${LLVM_PREFIX}bin/lldb 100 && \
update-alternatives --install /usr/bin/llvm-dlltool llvm-dlltool ${LLVM_PREFIX}bin/llvm-dlltool 100 && \
update-alternatives --install /usr/bin/llvm-opt-report llvm-opt-report ${LLVM_PREFIX}bin/llvm-opt-report 100 && \
update-alternatives --install /usr/bin/lldb-argdumper lldb-argdumper ${LLVM_PREFIX}bin/lldb-argdumper 100 && \
update-alternatives --install /usr/bin/llvm-dwarfdump llvm-dwarfdump ${LLVM_PREFIX}bin/llvm-dwarfdump 100 && \
update-alternatives --install /usr/bin/llvm-pdbutil llvm-pdbutil ${LLVM_PREFIX}bin/llvm-pdbutil 100 && \
update-alternatives --install /usr/bin/lldb-instr lldb-instr ${LLVM_PREFIX}bin/lldb-instr 100 && \
update-alternatives --install /usr/bin/llvm-dwp llvm-dwp ${LLVM_PREFIX}bin/llvm-dwp 100 && \
update-alternatives --install /usr/bin/llvm-profdata llvm-profdata ${LLVM_PREFIX}bin/llvm-profdata 100 && \
update-alternatives --install /usr/bin/lldb-server lldb-server ${LLVM_PREFIX}bin/lldb-server 100 && \
update-alternatives --install /usr/bin/llvm-elfabi llvm-elfabi ${LLVM_PREFIX}bin/llvm-elfabi 100 && \
update-alternatives --install /usr/bin/llvm-ranlib llvm-ranlib ${LLVM_PREFIX}bin/llvm-ranlib 100 && \
update-alternatives --install /usr/bin/lldb-vscode lldb-vscode ${LLVM_PREFIX}bin/lldb-vscode 100 && \
update-alternatives --install /usr/bin/llvm-exegesis llvm-exegesis ${LLVM_PREFIX}bin/llvm-exegesis 100 && \
update-alternatives --install /usr/bin/llvm-rc llvm-rc ${LLVM_PREFIX}bin/llvm-rc 100 && \
update-alternatives --install /usr/bin/lli lli ${LLVM_PREFIX}bin/lli 100 && \
update-alternatives --install /usr/bin/llvm-extract llvm-extract ${LLVM_PREFIX}bin/llvm-extract 100 && \
update-alternatives --install /usr/bin/llvm-readelf llvm-readelf ${LLVM_PREFIX}bin/llvm-readelf 100 && \
update-alternatives --install /usr/bin/llvm-gsymutil llvm-gsymutil ${LLVM_PREFIX}bin/llvm-gsymutil 100 && \
update-alternatives --install /usr/bin/llvm-readobj llvm-readobj ${LLVM_PREFIX}bin/llvm-readobj 100 && \
update-alternatives --install /usr/bin/llvm-ifs llvm-ifs ${LLVM_PREFIX}bin/llvm-ifs 100 && \
update-alternatives --install /usr/bin/llvm-reduce llvm-reduce ${LLVM_PREFIX}bin/llvm-reduce 100 && \
update-alternatives --install /usr/bin/llvm-addr2line llvm-addr2line ${LLVM_PREFIX}bin/llvm-addr2line 100 && \
update-alternatives --install /usr/bin/llvm-install-name-tool llvm-install-name-tool ${LLVM_PREFIX}bin/llvm-install-name-tool 100 && \
update-alternatives --install /usr/bin/llvm-rtdyld llvm-rtdyld ${LLVM_PREFIX}bin/llvm-rtdyld 100 && \
update-alternatives --install /usr/bin/llvm-ar llvm-ar ${LLVM_PREFIX}bin/llvm-ar 100 && \
update-alternatives --install /usr/bin/llvm-jitlink llvm-jitlink ${LLVM_PREFIX}bin/llvm-jitlink 100 && \
update-alternatives --install /usr/bin/llvm-size llvm-size ${LLVM_PREFIX}bin/llvm-size 100 && \
update-alternatives --install /usr/bin/llvm-as llvm-as ${LLVM_PREFIX}bin/llvm-as 100 && \
update-alternatives --install /usr/bin/llvm-lib llvm-lib ${LLVM_PREFIX}bin/llvm-lib 100 && \
update-alternatives --install /usr/bin/llvm-split llvm-split ${LLVM_PREFIX}bin/llvm-split 100 && \
update-alternatives --install /usr/bin/llvm-bcanalyzer llvm-bcanalyzer ${LLVM_PREFIX}bin/llvm-bcanalyzer 100 && \
update-alternatives --install /usr/bin/llvm-link llvm-link ${LLVM_PREFIX}bin/llvm-link 100 && \
update-alternatives --install /usr/bin/llvm-stress llvm-stress ${LLVM_PREFIX}bin/llvm-stress 100 && \
update-alternatives --install /usr/bin/llvm-c-test llvm-c-test ${LLVM_PREFIX}bin/llvm-c-test 100 && \
update-alternatives --install /usr/bin/llvm-lipo llvm-lipo ${LLVM_PREFIX}bin/llvm-lipo 100 && \
update-alternatives --install /usr/bin/llvm-strings llvm-strings ${LLVM_PREFIX}bin/llvm-strings 100 && \
update-alternatives --install /usr/bin/llvm-cat llvm-cat ${LLVM_PREFIX}bin/llvm-cat 100 && \
update-alternatives --install /usr/bin/llvm-lto llvm-lto ${LLVM_PREFIX}bin/llvm-lto 100 && \
update-alternatives --install /usr/bin/llvm-strip llvm-strip ${LLVM_PREFIX}bin/llvm-strip 100 && \
update-alternatives --install /usr/bin/llvm-cfi-verify llvm-cfi-verify ${LLVM_PREFIX}bin/llvm-cfi-verify 100 && \
update-alternatives --install /usr/bin/llvm-lto2 llvm-lto2 ${LLVM_PREFIX}bin/llvm-lto2 100 && \
update-alternatives --install /usr/bin/llvm-symbolizer llvm-symbolizer ${LLVM_PREFIX}bin/llvm-symbolizer 100 && \
update-alternatives --install /usr/bin/llvm-config llvm-config ${LLVM_PREFIX}bin/llvm-config 100 && \
update-alternatives --install /usr/bin/llvm-mc llvm-mc ${LLVM_PREFIX}bin/llvm-mc 100 && \
update-alternatives --install /usr/bin/llvm-tblgen llvm-tblgen ${LLVM_PREFIX}bin/llvm-tblgen 100 && \
update-alternatives --install /usr/bin/llvm-cov llvm-cov ${LLVM_PREFIX}bin/llvm-cov 100 && \
update-alternatives --install /usr/bin/llvm-mca llvm-mca ${LLVM_PREFIX}bin/llvm-mca 100 && \
update-alternatives --install /usr/bin/llvm-undname llvm-undname ${LLVM_PREFIX}bin/llvm-undname 100 && \
update-alternatives --install /usr/bin/llvm-cvtres llvm-cvtres ${LLVM_PREFIX}bin/llvm-cvtres 100 && \
update-alternatives --install /usr/bin/llvm-ml llvm-ml ${LLVM_PREFIX}bin/llvm-ml 100 && \
update-alternatives --install /usr/bin/llvm-xray llvm-xray ${LLVM_PREFIX}bin/llvm-xray 100 && \
update-alternatives --install /usr/bin/llvm-cxxdump llvm-cxxdump ${LLVM_PREFIX}bin/llvm-cxxdump 100 && \
update-alternatives --install /usr/bin/llvm-modextract llvm-modextract ${LLVM_PREFIX}bin/llvm-modextract 100

