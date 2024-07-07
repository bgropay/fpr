#!/bin/bash
# [menu_utama.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[0;34m" # biru terang 
r="\e[0m"

daftar_menu=(
        "Ekstrak hash"
        "Buat daftar kata sandi (Wordlist)"
        "Memulihkan kata sandi (Membutuhkan hash & Wordlist)"
        "Keluar"
    )

c=1

while true; do
        c=1
        clear
        echo -e "${hm}******************** Menu utama FPR ********************${r}"
        echo ""
        echo -e "${ht}Pilih opsi dari menu:${r}"
        echo -e "${bt}----------${r}"
        for menu in "${daftar_menu[@]}"; do
                echo "${c}. ${menu}"
                if [[ "${c}" -eq 1 ]]; then
                        echo -e "${bt}----------${r}"
                elif [[ "${c}" -eq 2 ]]; then
                        echo -e "${bt}----------${r}"
                elif [[ "${c}" -eq 3 ]]; then
                        echo -e "${bt}----------${r}"
                elif [[ "${c}" -eq 4 ]]; then
                        echo -e "${bt}----------${r}"
                fi
                ((c++))
        done
        read -p "" mu
        case "${mu}" in
                1)
                        ehfz="src/ekstrak_hash/ekstrak_hash_file_zip.sh"
                        if [[ ! -f "${ehfz}" ]]; then
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehfz}' tidak ditemukan.${r}"
                                exit 1
                        else
                                # ekstrak hash file zip
                                bash "${ehfz}"
                        fi
                        ;;
                2)
                        # ekstrak hash file rar
                        ehfr="src/ekstrak_hash/ekstrak_hash_file_rar.sh"
                        if [[ ! -f "${ehfr}" ]]; then
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehfr}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${ehfr}"
                        fi
                        ;;
                3)
                        # ekstrak hash file 7z
                        ehf7="src/ekstrak_hash/ekstrak_hash_file_7z.sh"
                        if [[ ! -f "${ehf7}" ]]; then
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehf7}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${ehf7}"
                        fi
                        ;;
                4)
                        # ekstrak hash file pdf
                        ehfp="src/ekstrak_hash/ekstrak_hash_file_pdf.sh"
                        if [[ ! -f "${ehfp}" ]]; then
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehfp}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${ehfp}"
                        fi
                        ;;
                5)
                        # ekstrak hash file office 
                        ehfo="src/ekstrak_hash/ekstrak_hash_file_office.sh"
                        if [[ ! -f "${ehfo}" ]]; then
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehfo}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${ehfo}"
                        fi
                        ;;
        esac
done
