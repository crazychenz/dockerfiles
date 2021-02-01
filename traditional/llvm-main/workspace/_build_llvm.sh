#!/bin/bash

if [ -d "/workspace/llvm-project" ] 
then
    # Already cloned, look for updates from origin.
    # echo .
    pushd llvm-project ; git pull ; popd
else
    # Grab (>1.2 GiB) LLVM source code repository
    git clone https://github.com/llvm/llvm-project.git
fi

if [ -d "/workspace/llvm-build" ] 
then
  # cmake already run
  cd llvm-build
else
  # Create build directory and run cmake
  mkdir llvm-build
  cd llvm-build
  cmake -G Ninja \
    -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;libcxx;libcxxabi;libunwind;lldb;compiler-rt;lld;polly;debuginfo-tests" \
    -DCMAKE_INSTALL_PREFIX=/opt/llvm-main \
    -DCMAKE_BUILD_TYPE=Release \
    /workspace/llvm-project/llvm
fi

# Run the build
ninja -v