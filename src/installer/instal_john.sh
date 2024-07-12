#!/bin/bash
# [instal_john.sh]

# url github john the ripper 
url="https://github.com/magnumripper/JohnTheRipper -b bleeding-jumbo"

# list dependensi yang gagal diinstal 
ldygd=()

# list dependensi 
ld=(
    "libcrypt1"
    "libcrypt1-dev"
    "libgomp1"
    "cmake"
    "bison"
    "flex"
    "git"
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
for d in "${ld[@]}"; do
    echo -e "${bt}Menginstal dependensi '${d}'...${r}"
    sleep 1.5
    apt-get install "${d}" -y
    if [[ $? -eq 0 ]]; then
        echo -e "${ht}Dependensi '${d}' berhasil diinstal.${r}"
        sleep 1.5
    else
        echo -e "${mt}Dependensi '${d}' gagal diinstal.${r}"
        ldygd+=("${d}")
        sleep 1.5
    fi
done

if [[ "${#ldygd[@]}" -eq 0 ]]; then
    echo -e "${ct}Seluruh dependensi yang diperlukan oleh John The Ripper berhasil diinstal.${r}"
    sleep 1.5
fi

# mengkloning john the ripper 
echo -e "${kt} Mengkloning John The Ripper...${r}"
sleep 3
git clone  "${url}"
if [[ $? -eq 0 ]]; then
    echo -e "${ht} Berhasil mengkloning John The Ripper.${r}"
    sleep 1.5
else
    echo -e "${mt} Gagal mengkloning John The Ripper.${r}"
    sleep 1.5
fi

cd JohnTheRipper/src

# mempersiapkan lingkungan kompilasi john the ripper 
echo -e "${kt}Mempersiapkan lingkungan kompilasi John The Ripper...${r}"
sleep 3
./configure
if [[ $? -eq 0 ]]; then
    echo -e "${ht} Berhasil mempersiapkan lingkungan kompilasi John The Ripper.${r}"
    sleep 1.5
else
    echo -e "${mt} Gagal mempersiapkan lingkungan kompilasi John The Ripper.${r}"
    sleep 1.5
fi

# membersihkan hasil kompilasi sebelumnya
echo -e "${kt} Mengkompilasi John The Ripper...${r}"
sleep 3
make -s clean && make -sj4 
if [[ $? -eq 0 ]]; then
    echo -e "${ht} Berhasil mengkompilasi John The Ripper.${r}"
    sleep 1.5
else
    echo -e "${mt} Gagal mengkompilasi John The Ripper.${r}"
    sleep 1.5
fi
