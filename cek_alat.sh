#!/bin/bash
daftar_alat=(
    "zip2john"
    "john"
)

alat_belum_terinstal=()

for alat in "${daftar_alat[@]}"; do
    echo "[*] Mengecek alat ${alat}..."
    if ! command -v "${alat}" >/dev/null 2>&1; then
        sleep 5
        echo "[-] Alat ${alat} belum terinstal."
        alat_belum_terinstal+=("${alat}")
    else
        sleep 3
        echo "[+] Alat ${alat} sudah terinstal."
    fi
done

if [ ${#alat_belum_terinstal[@]} -ne 0 ]; then
    echo "Program tidak bisa dijalankan karena alat berikut belum terinstal:"
    for alat in "${alat_belum_terinstal[@]}"; do
        echo "- ${alat}"
    done
    exit 1
else
    echo "Semua alat sudah terinstal. Program bisa dijalankan."
    # Tempatkan kode untuk menjalankan program Anda di sini
fi
