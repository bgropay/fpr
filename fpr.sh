#!/bin/bash
# [fpr.sh]
# file ini merupakan salah satu file dari projek FPR

# variabel warna 
kt="\e[1;33m"
bt="\e[1;34m"
pt="\e[1;37m"
r="\e[0m"

if [[ $(id -u) -ne 0 ]]; then
    echo -e "${kt}Script ini harus dijalani sebagai root.${r}"
    exit 1
fi

echo -e "${bt}[*] ${pt}Memulai FPR...${r}"
# menunggu selama 5 detik 
sleep 5

# file cek_alat.sh
fca="cek_alat.sh"

# mengecek apakah file cek_alat.sh ada atau tidak 
if [[ ! -f "${fca}" ]]; then
    echo -e "${kt}Script ini tidak bisa dijalankan karena file '${fca}' tidak ditemukan.${r}"
    exit 1
else
    # menjalankan file cek_alat.sh
    bash "${fca}"
fi
