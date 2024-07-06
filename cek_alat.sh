#!/bin/bash

clear
echo "******************** Selamat datang ********************"
echo "Program ini hanya untuk tujuan edukasi dan pembelajaran."
echo ""
echo "Mari kita periksa apakah Anda sudah menginstal alat-alat yang dibutuhkan oleh skrip ini."
echo ""
sleep 3

daftar_alat=(
    "john"
    "zip2john"
    "rar2john"
    "7zip2john"
    "pdf2john"
    "office2john"
)

alat_belum_terinstal=()

for alat in "${daftar_alat[@]}"; do
    sleep 0.1
    if ! command -v "${alat}" >/dev/null 2>&1; then
        echo "${alat} ... Error"
        alat_belum_terinstal+=("${alat}")
    else
        echo "${alat}...OK"
    fi
done

if [ ${#alat_belum_terinstal[@]} -ne 0 ]; then
    echo "Script ini tidak bisa dijalankan karena ada beberapa alat yang belum terinstal."
    exit 1
else
    echo "Semua alat sudah terinstal. Program bisa dijalankan."
    # Tempatkan kode untuk menjalankan program Anda di sini
fi
