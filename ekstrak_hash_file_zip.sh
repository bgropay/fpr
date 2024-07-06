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
                        echo "File ZIP '${fz}' tidak ditemukan."
                        continue
                else
                        if [[ "${fz##*.}" != "zip" ]]; then
                                echo "File '${fz}' bukan file ZIP."
                                continue
                        else
                                echo "File ZIP '${fz}' ditemukan."
                                break
                        fi
                fi
            done
            break
            ;;
        2)
            bash menu_utama.sh
            break
            ;;
    esac
done
