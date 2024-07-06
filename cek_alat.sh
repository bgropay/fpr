#!/bin/bash

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
    "zip2john"
    "rar2john"
    "7zip2john"
    "pdf2john"
    "office2john"
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

if [[ "${#apbt[@]}" -ne 0 -a "${#aobt[@]}" -ne 0 ]]; then
    echo "Script ini tidak bisa dijalankan karena ada beberapa alat yang belum terinstal."
    exit 1
else
    echo "Semua alat sudah terinstal. Program bisa dijalankan."
    # Tempatkan kode untuk menjalankan program Anda di sini
fi
