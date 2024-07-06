#!/bin/bash
# [fpr.shfile ini merupakan salah satu file dari projek FPR

kt="\e[1;33m"
bt="\e[1;34m"
pt="\e[1;37m"
r="\e[0m"

if [[ $(id -u) -ne 0 ]]; then
    echo -e "${kt}Script ini harus dijalani sebagai root.${r}"
    exit 1
fi

echo -e "${bt}[*] ${pt}Memulai FPR...${r}"
# menunggu selama 0.1 detik 
sleep 5

# file cek alat
fca="cek_alat.sh"

if [[ ! -f "${fca}" ]]; then
    echo -e "${kt}File '${fca}' tidak ditemukan.${r}"
    exit 1
else
    bash "${fca}"
fi
