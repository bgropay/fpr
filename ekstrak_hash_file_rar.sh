#!/bin/bash
# [ekstrak_hash_file_rar.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[0;34m" # biru terang 
r="\e[0m"


daftar_menu=(
    "Ekstrak hash file RAR"
    "Kembali ke menu utama"
)

c=1

while true; do
    c=1
    clear
    echo -e "${hm}******************** Menu Ekstrak Hash File RAR ********************${r}"
    echo ""
    echo -e "${ht}Pilih opsi dari menu:${r}"
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
    read -p "" ehfr
    case "${ehfr}" in
        1)
            echo ""
            while true; do
                read -p "Masukkan nama file RAR: " fr
                # Memastikan file ZIP yang diberikan ada
                if [[ ! -f "${fr}" ]]; then
                        echo -e "${kt}File RAR '${fr}' tidak ditemukan.${r}"
                        continue
                else
                        if [[ "${fr##*.}" != "rar" ]]; then
                                echo -e "${kt}File '${fr}' bukan file RAR.${r}"
                                continue
                        else
                                echo -e "${ht}File RAR '${fr}' ditemukan.${r}"
                                break
                        fi
                fi
            done
            echo ""
            read -p "Masukkan nama file untuk menyimpan hash file RAR: " nama_file_hash
            echo ""
            echo -e "${bt}Mengekstrak hash dari file RAR '${fr}'...${r}"
            sleep 3
            hash=$(/usr/share/JohnTheRipper/run/./rar2john "${fr}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
            echo "${hash}" > "${nama_file_hash}"
            # Memeriksa apakah hash berhasil dibuat
            if [[ -z "${nama_file_hash}" ]]; then
                echo -e "${kt}Gagal mengekstrak hash dari file RAR '${fr}'.${r}"
                exit 1
            else
                echo -e "${ht}Berhasil mengekstrak hash dari file RAR '${fr}'.${r}"
                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
            fi
            read -p "Tekan [Enter] untuk melanjutkan..."
            break
            ;;
        2)
            # file menu_utama.sh
            fmu="menu_utama.sh"

            # mengecek apakah file cek_alat.sh ada atau tidak 
            if [[ ! -f "${fmu}" ]]; then
                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${fmu}' tidak ditemukan.${r}"
                exit 1
            else
                # menjalankan file cek_alat.sh
                bash "${fmu}"
                break
            fi
            ;;
    esac
done
