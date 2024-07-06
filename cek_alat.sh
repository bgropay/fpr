#!/bin/bash
# [cek_alat.sh]
# file ini merupakan salah satu file dari projek FPR

hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bm="\e[0;34m" # biru muda
r="\e[0m"

clear
echo -e "${hm}******************** Selamat datang ********************${r}"
echo -e "${mt}Program ini hanya untuk tujuan edukasi dan pembelajaran.${r}"
echo ""
echo -e "${bm}Mari kita periksa apakah Anda sudah menginstal alat-alat yang dibutuhkan oleh skrip ini.${r}"
read -p "Tekan [Enter] untuk melanjutkan..."
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
echo -e "${bm}Alat penting: memeriksa...${r}"
for ap in "${dap[@]}"; do
    sleep 0.1
    if ! command -v "${ap}" >/dev/null 2>&1; then
        echo -e "${r}${ap} ... ${mt}Error${r}"
        apbt+=("${ap}")
    else
        echo -e "${r}${ap} ... ${ht}OK${r}"
    fi
done

echo ""

# cek alat opsional
echo -e "${bm}Alat opsional: memeriksa...${r}"
for ao in "${dao[@]}"; do
    sleep 0.1
    if ! command -v "${ao}" >/dev/null 2>&1; then
        echo -e "${r}${ao} ... ${mt}Error${r}"
        aobt+=("${ao}")
    else
        echo -e "${r}${ao} ... ${ht}OK${r}"
    fi
done

if [[ "${#apbt[@]}" -ne 0 ]]; then
    echo ""
    echo -e "${kt}Script ini tidak bisa dijalankan karena ada alat penting yang belum terinstal.${r}"
    exit 1
elif [[ "${#aobt[@]}" -ne 0 ]]; then
    echo ""
    echo -e "${kt}Script ini tidak bisa dijalankan karena ada alat opsional yang belum terinstal.${r}"
    exit 1
else
    echo ""
    echo -e "${kt}Semua alat yang diperlukan oleh script ini sudah terinstal. Script ini bisa dijalankan.${r}"
    read -p "Tekan [Enter] untuk melanjutkan..."
    # Tempatkan kode untuk menjalankan program Anda di sini
fi
