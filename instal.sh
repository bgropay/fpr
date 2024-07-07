#!/bin/bash
# [instal.sh]

cd /usr/share

# install john the ripper
dependensi_john=(
    "cmake"
    "bison"
    "flex"
    "libicu-dev"
    "build-essential"
    "libssl-dev"
    "git"
    "zlib1g-dev"
    "libgmp-dev"
    "yasm"
    "libpcap-dev"
    "pkg-config"
    "libbz2-dev"
    "libcompress-raw-lzma-perl"
    "perl"
    "python3"
    "python3-pip"
)

for instal_dependensi_john in "${dependensi_john[@]}"; do
    apt-get install "${instal_dependensi_john}" -y
done

git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo
cd JohnTheRipper/src
./configure
make -s clean && make -sj8
cd -
