#!/bin/bash
# [instal.sh]

# cek apakah dalam mode root atau tidak 
if [[ $(id -u) -ne 0 ]]; then
        echo "Script ini harus dijalani sebagai root."
        exit 1
fi

# variabel warna 
kt="\e[1;33m" # kuning terang 
ht="\e[1;36m" # hijau terang 
r="\e[0m"     # reset

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
echo -e "${kt}Menginstal seluruh dependensi yang diperlukan oleh John The Ripper.${r}"
sleep 3
for instal_dependensi_john in "${dependensi_john[@]}"; do
    echo -e "${kt}Menginstal dependensi '${instal_dependensi_john}'...${r}"
    sleep 1.5
    apt-get install "${instal_dependensi_john}" -y
    if [[ $? -eq 0 ]]; then
        echo -e "${ht}Dependensi '${instal_dependensi_john}' berhasil diinstal.${r}"
        sleep 1.5
    else
        echo -e "${kt}Dependensi '${instal_dependensi_john}' gagal diinstal.${r}"
        sleep 1.5
    fi
done

# menginstal seluruh dependensi yang diperlukan oleh hashcat 
echo -e "${kt}Menginstal seluruh dependensi yang diperlukan oleh Hashcat.${r}"
sleep 3
for instal_dependensi_hashcat in "${dependensi_hashcat[@]}"; do
    apt-get install "${instal_dependensi_hashcat}" -y
    echo -e "${kt}Menginstal dependensi '${instal_dependensi_hashcat}'...${r}"
    sleep 1.5
    if [[ $? -eq 0 ]]; then
        echo -e "${ht}Dependensi '${instal_dependensi_hashcat}' berhasil diinstal.${r}"
        sleep 1.5
    else
        echo -e "${kt}Dependensi '${instal_dependensi_hashcat}' gagal diinstal.${r}"
        sleep 1.5
    fi
done

# pindah ke direktori untuk menyimpan john the ripper dan hashcat '/opt'
cd "${path}"

# mengunduh john the ripper 
echo -e "${kt}Mengunduh John The Ripper...${r}"
sleep 3
wget "${url_john}"
if [[ $? -eq 0 ]]; then
    echo -e "${ht}John The Ripper berhasil diunduh.${r}"
    sleep 1.5
else
    echo -e "${kt}John The Ripper gagal diunduh.${r}"
    sleep 1.5
fi

# nama file hasil download
hasil_download_john="john-1.9.0-jumbo-1.tar.gz"

# mengekstrak john the ripper 
echo -e "${kt}Mengekstrak John The Ripper...${r}"
sleep 3
tar -xzvf "${hasil_download_john}"
if [[ $? -eq 0 ]]; then
    echo -e "${ht}John The Ripper berhasil diekstrak.${r}"
    sleep 1.5
else
    echo -e "${kt}John The Ripper gagal diekstrak.${r}"
    sleep 1.5
fi


# cd /usr/share
# cd JohnTheRipper
# git clone https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo
# cd JohnTheRipper/src
#../configure
# make -s clean && make -sj8
# cd ../../
# git clone https://github.com/Mebus/cupp
# cd -
