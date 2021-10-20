#!/bin/bash

set -ex

if [[ ${target_platform} == linux-* ]]; then
  LDFLAGS="$LDFLAGS -pthread"
fi

if [[ ${target_platform} == osx-arm64 ]]; then
  TARGET="--target=arm64-darwin-gcc"
  export CROSS=arm64-apple-darwin20.0.0-
fi

./configure --prefix=${PREFIX} ${TARGET} \
            --as=yasm                    \
            --enable-shared              \
            --disable-static             \
            --disable-install-docs       \
            --disable-install-srcs       \
            --enable-vp8                 \
            --enable-postproc            \
            --enable-vp9                 \
            --enable-vp9-highbitdepth    \
            --enable-pic                 \
            --enable-runtime-cpu-detect  \
            --enable-experimental || { cat config.log; exit 1; }

make -j${CPU_COUNT} V=1
make install
