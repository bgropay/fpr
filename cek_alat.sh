#!/bin/bash
# [cek_alat.sh]
# file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
ut="\e[1;35m" # ungu terang
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[1;34m" # biru terang 
r="\e[0m"

clear
echo -e "${hm}******************** Selamat datang ********************${r}"
echo -e "${ut}Program ini hanya untuk tujuan edukasi dan pembelajaran.${r}"
echo ""
echo -e "${bt}Mari kita periksa apakah Anda sudah menginstal alat-alat yang dibutuhkan oleh skrip ini.${r}"
read -p "Tekan [Enter] untuk melanjutkan..."
echo ""

# daftar alat penting
dap=(
    "/usr/share/john/run/john"
    "/usr/share/hashcat/run/hashcat"
)

# daftar alat opsional
dao=(
    "/usr/share/john/run/zip2john"    # alat untuk mengekstrak hash file zip
    "/usr/share/john/run/rar2john"    # alat untuk mengekstrak hash file rar
    "/usr/share/john/run/7z2john"     # alat untuk mengekstrak hash file 7z
    "/usr/share/john/run/pdf2john"    # alat untuk mengekstrak hash file pdf
    "/usr/share/john/run/office2john" # alat untuk mengekstrak hash file office (docx, xlxs, pptx)
)

# alat penting belum terinstal 
apbt=()

# alat opsional belum terinstal 
aobt=()

# cek alat penting 
echo -e "${bt}Alat penting: memeriksa...${r}"
for ap in "${dap[@]}"; do
    sleep 0.1
    if [[ ! -f "${ap}" ]]; then
        if [[ "${ap}" == "/usr/share/john/run/john" ]]; then
            echo -e "${r}${ap} ... ${mt}Error${r}"
            apbt+=("${ap}")
        fi
    else
        echo -e "${r}${ap} ... ${ht}OK${r}"
    fi
done

echo ""

# cek alat opsional
echo -e "${bt}Alat opsional: memeriksa...${r}"
for ao in "${dao[@]}"; do
    sleep 0.1
    if [[ ! -f "${ao}" ]]; then
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
    # file menu_utama.sh
    fmu="menu_utama.sh"

    # mengecek apakah file cek_alat.sh ada atau tidak 
    if [[ ! -f "${fmu}" ]]; then
        echo -e "${kt}Script ini tidak bisa dijalankan karena file '${fmu}' tidak ditemukan.${r}"
        exit 1
    else
        # menjalankan file cek_alat.sh
        bash "${fmu}"
    fi
fi
