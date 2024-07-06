daftar_alat=(
        "zip2john"
        "john"
)

for alat in "${daftar_alat[@]}"; do
        echo "[*] Mengecek alat ${alat}..."
        if ! command -v "${alat}" >/dev/null 2>&1; then
                time.sleep(5)
                echo "[-] Alat ${alat} belum terinstal."
        else
                time.sleep(3)
                echo "[+] Alat ${alat} sudah terinstal."
        fi
done
