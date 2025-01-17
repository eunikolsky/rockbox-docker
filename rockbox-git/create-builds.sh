#!/bin/bash
cd /tmp
mkdir -p /usr/src/rockbox/artifacts

# FullZip for Sansa Clip+
[[ -f Makefile ]] || /usr/src/rockbox/rockbox/tools/configure --target=62 --type=N
make clean && make -j && make fullzip
mv rockbox-full.zip /usr/src/rockbox/artifacts/sansaclipp-rockbox-full.zip
