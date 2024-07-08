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

# file menu cek_alat.sh
fmca="src/menu_cek_alat.sh"

# mengecek apakah file cek_alat.sh ada atau tidak 
if [[ ! -f "${fmca}" ]]; then
        echo ""
        echo -e "${kt}Script ini tidak bisa dijalankan karena file '${fmca}' tidak ditemukan.${r}"
        exit 1
else
        banner=$(python3 src/lainnya/banner.py >> /dev/null 2>&1)
        if [[ "${banner}" == "No module named 'colorama'" ]]; then
                echo "error"
                exit 1
        fi
        # menjalankan file cek_alat.sh
        bash "${fmca}"
fi
