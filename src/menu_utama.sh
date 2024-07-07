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
                        mehf="src/menu_ekstrak_hash_file.sh"
                        if [[ ! -f "${mehf}" ]]; then
                                echo ""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${mehf}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${mehf}"
                        fi
                        ;;
                2)
                        mbdks="src/menu_buat_daftar_kata_sandi.sh"
                        if [[ ! -f "${mbdks}" ]]; then
                                echo ""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${mbdks}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${mbdks}"
                        fi
                        ;;
                3)
                        # menu pulihkan kata sandi file
                        mpksf="src/menu_pulihkan_kata_sandi_file.sh"
                        if [[ ! -f "${mpksf}" ]]; then
                                echo ""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${mpksf}' tidak ditemukan.${r}"
                                read -p ""
                                exit 1
                        else
                                bash "${mpksf}"
                        fi
                        ;;
                *)
                 
        esac
done
