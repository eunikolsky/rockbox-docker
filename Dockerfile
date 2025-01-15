FROM ubuntu:22.04

# Install required tools
RUN apt-get update -y && apt-get install -y build-essential libsdl1.2-dev zip unzip git texinfo automake libtool libtool-bin autoconf flex bison curl wget libgmp-dev && rm -rf /var/cache/apt/archives /var/lib/apt/lists

RUN mkdir /tmp/rbdev-dl
COPY dl/* /tmp/rbdev-dl/

# Clone Rockbox
WORKDIR /usr/src
RUN git clone --depth=1 https://github.com/Rockbox/rockbox.git
WORKDIR /usr/src/rockbox/build

# Configure dev environment
RUN ../tools/rockboxdev.sh --target=a --makeflags=-j
#RUN which arm-elf-eabi-gcc

# FullZip for sansa clip+
RUN PATH=/tmp/local/bin:$PATH ../tools/configure --target=62 --type=N
RUN make -j && make fullzip
#RUN mv rockbox-full.zip ipodmini1g-rockbox-full.zip

#WORKDIR /usr/src
#RUN git pull
#WORKDIR /usr/src/rockbox/build
##RUN ../tools/configure --target=62
#RUN make -j && make fullzip

WORKDIR /
