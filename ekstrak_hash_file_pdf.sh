#!/bin/bash
# [ekstrak_hash_file_pdf.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[0;34m" # biru terang 
r="\e[0m"


daftar_menu=(
    "Ekstrak hash file PDF"
    "Kembali ke menu utama"
)

c=1

while true; do
    c=1
    clear
    echo -e "${hm}******************** Menu Ekstrak Hash File PDF ********************${r}"
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
    read -p "" ehfp
    case "${ehfp}" in
        1)
            echo ""
            while true; do
                read -p "Masukkan nama file PDF: " fp
                # Memastikan file PDF yang diberikan ada
                if [[ ! -f "${fp}" ]]; then
                        echo -e "${kt}File PDF '${fp}' tidak ditemukan.${r}"
                        continue
                else
                        if [[ "${fp##*.}" != "pdf" ]]; then
                                echo -e "${kt}File '${fp}' bukan file PDF.${r}"
                                continue
                        else
                                echo -e "${ht}File PDF '${fp}' ditemukan.${r}"
                                break
                        fi
                fi
            done
            echo ""
            read -p "Masukkan nama file untuk menyimpan hash file PDF: " nama_file_hash
            echo ""
            echo -e "${bt}Mengekstrak hash dari file PDF '${fp}'...${r}"
            sleep 3
            hash=$(/usr/share/JohnTheRipper/run/./pdf2john.pl "${fz}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
            echo "${hash}" > "${nama_file_hash}"
            # Memeriksa apakah hash berhasil dibuat
            if [[ -z "${nama_file_hash}" ]]; then
                echo -e "${kt}Gagal mengekstrak hash dari file PDF '${fp}'.${r}"
                exit 1
            else
                echo -e "${ht}Berhasil mengekstrak hash dari file PDF '${fp}'.${r}"
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
