#!/bin/bash
# [instal.sh]

# path atau lokasi folder untuk menyimpan tools 
path="/opt"

# url john the ripper 
url_john="https://www.openwall.com/john/k/john-1.9.0-jumbo-1.tar.gz"
# url hashcat
url_hashcat="https://hashcat.net/files/hashcat-6.2.6.tar.gz"

# dependensi yang diperlukan oleh john the ripper 
dependensi_john=(
    "libcrypt1"
    "libcrypt1-dev"
    "libgomp1"
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

# dependensi yang diperlukan oleh hashcat
dependensi_hashcat=(
    "build-essential"
    "libssl-dev"
    "zlib1g-dev"
)

echo "[*] Menginstal seluruh dependensi yang diperlukan oleh John The Ripper."
sleep 3
for instal_dependensi_john in "${dependensi_john[@]}"; do
    apt-get install "${instal_dependensi_john}" -y
done

echo "[*] Menginstal seluruh dependensi yang diperlukan oleh Hashcat."
sleep 3

cd /usr/share
cd JohnTheRipper
git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo
cd JohnTheRipper/src
./configure
make -s clean && make -sj8
cd ../../
git clone https://github.com/Mebus/cupp
cd -
