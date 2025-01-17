#!/bin/bash
set -eu

mkdir -p /usr/src/rockbox/{artifacts,build} || true
cd /usr/src/rockbox/build

# FullZip for Sansa Clip+
[[ -f Makefile ]] || /usr/src/rockbox/rockbox/tools/configure --target=62 --type=N
make -j && make fullzip
mv rockbox-full.zip /usr/src/rockbox/artifacts/sansaclipp-rockbox-full.zip
