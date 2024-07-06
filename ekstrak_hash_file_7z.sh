#!/bin/bash
# [ekstrak_hash_file_7z.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[0;34m" # biru terang 
r="\e[0m"


daftar_menu=(
    "Ekstrak hash file 7z"
    "Kembali ke menu utama"
)

c=1

while true; do
    c=1
    clear
    echo -e "${hm}******************** Menu Ekstrak Hash File 7z ********************${r}"
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
    read -p "" ehf7
    case "${ehf7}" in
        1)
            echo ""
            while true; do
                read -p "Masukkan nama file 7z: " f7
                # Memastikan file 7z yang diberikan ada
                if [[ ! -f "${f7}" ]]; then
                        echo -e "${kt}File 7z '${f7}' tidak ditemukan.${r}"
                        continue
                else
                        if [[ "${f7##*.}" != "7z" ]]; then
                                echo -e "${kt}File '${f7}' bukan file 7z.${r}"
                                continue
                        else
                                echo -e "${ht}File 7z '${f7}' ditemukan.${r}"
                                break
                        fi
                fi
            done
            echo ""
            read -p "Masukkan nama file untuk menyimpan hash file 7z: " nama_file_hash
            echo ""
            echo -e "${bt}Mengekstrak hash dari file 7z '${f7}'...${r}"
            sleep 3
            hash=$(7z2john "${f7}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
            echo "${hash}" > "${nama_file_hash}"
            # Memeriksa apakah hash berhasil dibuat
            if [[ -z "${nama_file_hash}" ]]; then
                echo -e "${kt}Gagal mengekstrak hash dari file 7z '${f7}'.${r}"
                exit 1
            else
                echo -e "${ht}Berhasil mengekstrak hash dari file 7z '${f7}'.${r}"
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
