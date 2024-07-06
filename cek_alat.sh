#!/bin/bash
# [cek_alat.sh]
# file ini merupakan salah satu file dari projek FPR

hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
bm="\e[0;34m" # biru muda
r="\e[0m"

clear
echo -e "${hm}******************** Selamat datang ********************${r}"
echo -e "${mt}Program ini hanya untuk tujuan edukasi dan pembelajaran.${r}"
echo ""
echo -e "${bm}Mari kita periksa apakah Anda sudah menginstal alat-alat yang dibutuhkan oleh skrip ini.${r}"
read -p $'\e[0;32mTekan [Enter] untuk melanjutkan\e[0m...'
echo ""

# daftar alat penting
dap=(
    "john"
    "hashcat"
)

# daftar alat opsional
dao=(
    "zip2john"    # alat untuk mengekstrak hash file zip
    "rar2john"    # alat untuk mengekstrak hash file rar
    "7z2john"     # alat untuk mengekstrak hash file 7z
    "pdf2john"    # alat untuk mengekstrak hash file pdf
    "office2john" # alat untuk mengekstrak hash file office (docx, xlxs, pptx)
)

# alat penting belum terinstal 
apbt=()

# alat opsional belum terinstal 
aobt=()

# cek alat penting 
echo "Alat penting: memeriksa..."
for ap in "${dap[@]}"; do
    sleep 0.1
    if ! command -v "${ap}" >/dev/null 2>&1; then
        echo "${ap} ... Error"
        apbt+=("${ap}")
    else
        echo "${ap}...OK"
    fi
done

echo ""

# cek alat opsional
echo "Alat opsional: memeriksa..."
for ao in "${dao[@]}"; do
    sleep 0.1
    if ! command -v "${ao}" >/dev/null 2>&1; then
        echo "${ao} ... Error"
        aobt+=("${ao}")
    else
        echo "${ao}...OK"
    fi
done

if [[ "${#apbt[@]}" -ne 0 ]]; then
    echo ""
    echo "Script ini tidak bisa dijalankan karena ada alat penting yang belum terinstal."
    exit 1
elif [[ "${#aobt[@]}" -ne 0 ]]; then
    echo ""
    echo "Script ini tidak bisa dijalankan karena ada alat opsional yang belum terinstal."
    exit 1
else
    echo ""
    echo "Semua alat yang diperlukan oleh script ini sudah terinstal. Script ini bisa dijalankan."
    read -p "Tekan [Enter] untuk melanjutkan..."
    # Tempatkan kode untuk menjalankan program Anda di sini
fi
