#!/bin/bash
# [ekstrak_hash_file_zip.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
cm="\e[0;36m" # cyan muda
ct="\e[1;36m" # cyan terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[0;34m" # biru terang 
r="\e[0m"


daftar_menu=(
    "Ekstrak hash file ZIP"
    "Kembali ke menu utama"
)

c=1

while true; do
    c=1
    clear
    echo -e "${cm}******************** Menu Ekstrak Hash File ZIP ********************${r}"
    echo ""
    echo -e "${ct}Pilih opsi dari menu:${r}"
    echo -e "${bt}----------${r}"
    for menu in "${daftar_menu[@]}"; do
        echo "${c}. ${menu}"
        if [[ "${c}" -eq 1 ]]; then
            echo -e "${bt}----------${r}"
        elif [[ "${c}" -eq 2 ]]; then
            echo -e "${bt}----------${r}"
        fi
        ((c++))
    done
    read -p "" ehfz
    case "${ehfz}" in
        1)
            while true; do
                read -p "Masukkan jalur ke file ZIP: " fz
                # Memastikan file ZIP yang diberikan ada
                if [[ ! -f "${fz}" ]]; then
                        echo -e "${kt}File ZIP '${fz}' tidak ditemukan.${r}"
                        continue
                else
                        if [[ "${fz##*.}" != "zip" ]]; then
                                echo -e "${kt}File '${fz}' bukan file ZIP.${r}"
                                continue
                        else
                                echo -e "${ct}File ZIP '${fz}' ditemukan.${r}"
                                break
                        fi
                fi
            done
            echo ""
            echo -e "${bt}Mengekstrak hash dari file ZIP '${fz}'...${r}"
            sleep 3
            hash=$(zip2john "${fz}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
            nama_file_hash="${fz}_hash.txt"
            echo "${hash}" > "${nama_file_hash}"
            # Memeriksa apakah hash berhasil dibuat
            if [[ -z "${nama_file_hash}" ]]; then
                echo -e "${kt}Gagal mengekstrak hash dari file ZIP '${fz}'.${r}"
                exit 1
            else
                echo -e "${ct}Berhasil mengekstrak hash dari file ZIP '${fz}'.${r}"
            fi
            read -p "Tekan [Enter] untuk melanjutkan..."
            break
            ;;
        2)
            bash menu_utama.sh
            break
            ;;
    esac
done
