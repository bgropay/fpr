while true; do
    read -p "Masukkan nama file ZIP: " fz
    # Memastikan file ZIP yang diberikan ada
    if [[ ! -f "${fz}" ]]; then
        echo -e "${kt}File ZIP '${fz}' tidak ditemukan.${r}"
        continue
    else
        if [[ "${fz##*.}" != "zip" ]]; then
            echo -e "${kt}File '${fz}' bukan file ZIP.${r}"
            continue
        else
            echo -e "${ht}File ZIP '${fz}' ditemukan.${r}"
            break
        fi
    fi
done

echo ""
read -p "Masukkan nama file untuk menyimpan hash file ZIP: " nama_file_hash
echo ""
echo -e "${bt}Mengekstrak hash dari file ZIP '${fz}'...${r}"
sleep 3

hash=$(/opt/JohnTheRipper/run/zip2john "${fz}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
echo "${hash}" > "${nama_file_hash}"

# Memeriksa apakah hash berhasil dibuat
if [[ -z "${hash}" ]]; then
    echo -e "${kt}Gagal mengekstrak hash dari file ZIP '${fz}'.${r}"
    exit 1
else
    echo -e "${ht}Berhasil mengekstrak hash dari file ZIP '${fz}'.${r}"
    echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
fi

echo ""
read -p "Tekan [Enter] untuk melanjutkan..."
