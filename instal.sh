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

# menginstal seluruh depan yang diperlukan oleh john the ripper 
echo "[*] Menginstal seluruh dependensi yang diperlukan oleh John The Ripper."
sleep 3
for instal_dependensi_john in "${dependensi_john[@]}"; do
    echo "[*] Menginstal dependensi '${instal_dependensi_john}'..."
    sleep 1.5
    apt-get install "${instal_dependensi_john}" -y
    if [[ $? -eq 0 ]]; then
        echo "[+] Dependensi '${instal_dependensi_john}' berhasil diinstal."
    else
        echo "[-] Dependensi '${instal_dependensi_john}' gagal diinstal."
    fi
done

# menginstal seluruh dependensi yang diperlukan oleh hashcat 
echo "[*] Menginstal seluruh dependensi yang diperlukan oleh Hashcat."
sleep 3
for instal_dependensi_hashcat in "${dependensi_hashcat[@]}"; do
    apt-get install "${instal_dependensi_hashcat}" -y
    echo "[*] Menginstal dependensi '${instal_dependensi_hashcat}'..."
    sleep 1.5
    if [[ $? -eq 0 ]]; then
        echo "[+] Dependensi '${instal_dependensi_hashcat}' berhasil diinstal."
    else
        echo "[-] Dependensi '${instal_dependensi_hashcat}' gagal diinstal."
    fi
done

cd /usr/share
cd JohnTheRipper
git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo
cd JohnTheRipper/src
./configure
make -s clean && make -sj8
cd ../../
git clone https://github.com/Mebus/cupp
cd -
