#!/bin/bash
# [cek_file.sh]
# file ini merupakan salah satu file dari projek FPR

clear
echo "******************** Selamat datang ********************"
echo "Program ini hanya untuk tujuan edukasi dan pembelajaran."
echo ""
echo "Mari kita periksa apakah Anda sudah menginstal alat-alat yang dibutuhkan oleh skrip ini."
echo ""
sleep 3

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
sleep 0.5
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
sleep 0.5
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
