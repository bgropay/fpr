#!/bin/bash
# [instal.sh]

# cek apakah dalam mode root atau tidak 
if [[ $(id -u) -ne 0 ]]; then
        echo "Script ini harus dijalani sebagai root."
        exit 1
fi

# variabel warna 
bt="\e[1;34m" # biru terang  
kt="\e[1;33m" # kuning terang  
mt="\e[1;31m" # merah terang  
ht="\e[1;32m" # hijau terang 
ct="\e[1;36m" # cyan terang 
r="\e[0m"     # reset

# path atau lokasi folder untuk menyimpan tools 
path="/opt"

# url john the ripper 
url_john="https://github.com/magnumripper/JohnTheRipper"
# url cup
url_cup="https://github.com/Mebus/cupp"

depedensi_john_gagal=()

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

# menginstal seluruh depan yang diperlukan oleh john the ripper 
echo -e "${kt}Menginstal seluruh dependensi yang diperlukan oleh John The Ripper.${r}"
sleep 3
for instal_dependensi_john in "${dependensi_john[@]}"; do
    echo -e "${bt}Menginstal dependensi '${instal_dependensi_john}'...${r}"
    sleep 1.5
    apt-get install "${instal_dependensi_john}" -y
    if [[ $? -eq 0 ]]; then
        echo -e "${ht}Dependensi '${instal_dependensi_john}' berhasil diinstal.${r}"
        sleep 1.5
    else
        echo -e "${mt}Dependensi '${instal_dependensi_john}' gagal diinstal.${r}"
        depedensi_john_gagal+=("${instal_dependensi_john}")
        sleep 1.5
    fi
done

if [[ "${#depedensi_john_gagal[@]}" -eq 0 ]]; then
    echo -e "${ct}Seluruh dependensi yang diperlukan oleh John The Ripper berhasil diinstal.${r}"
    sleep 1.5
fi

# pindah ke direktori untuk menyimpan john the ripper dan hashcat '/opt'
cd "${path}"

# mengkloning john the ripper 
echo -e "${kt}Mengkloning John The Ripper...${r}"
sleep 3
git clone "${url_john}" -b bleeding-jumbo
if [[ $? -eq 0 ]]; then
    echo -e "${ht}Berhasil mengkloning John The Ripper.${r}"
    sleep 1.5
else
    echo -e "${mt}Gagal mengkloning John The Ripper.${r}"
    sleep 1.5
fi

# nama folder hasil kloning john the ripper 
john="JohnTheRipper"

# pindah ke direktori 'src' john the ripper 
cd "${john}/src"

# mempersiapkan lingkungan kompilasi john the ripper 
echo -e "${kt}Mempersiapkan lingkungan kompilasi John The Ripper...${r}"
sleep 3
./configure
if [[ $? -eq 0 ]]; then
    echo -e "${ht}Berhasil mempersiapkan lingkungan kompilasi John The Ripper.${r}"
    sleep 1.5
else
    echo -e "${mt}Gagal mempersiapkan lingkungan kompilasi John The Ripper.${r}"
    sleep 1.5
fi

# mengkompilasi john the ripper 
echo -e "${kt}Mengkompilasi John The Ripper...${r}"
sleep 3
make -s clean && make -sj4 
if [[ $? -eq 0 ]]; then
    echo -e "${ht}Berhasil mengkompilasi John The Ripper.${r}"
    sleep 1.5
else
    echo -e "${mt}Gagal mengkompilasi John The Ripper.${r}"
    sleep 1.5
fi

cd -
