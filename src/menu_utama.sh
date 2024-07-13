#!/bin/bash
# [menu_utama.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
ct="\e[1;36m" # cyan terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
pt="\e[1;37m" # putih terang 
bt="\e[0;34m" # biru terang 
r="\e[0m"

daftar_menu=(
        "Ekstrak hash file"
        "Buat Wordlist"
        "Download Wordlist"
        "Pulihkan kata sandi file (Membutuhkan hash & Wordlist)"
        "Keluar"
    )

c=1

w=$(date "+%d-%m-%Y %H:%M:%S")

while true; do
        c=1
        clear
        echo -e "${pt}[ ${hm}Menu utama FPR${pt} ] [ ${mt}${w}${pt} ]${r}"
        echo ""
        echo -e "${ht}Silahkan pilih menu dibawah ini:${r}"
        echo ""
        for menu in "${daftar_menu[@]}"; do
                echo -e "${kt}[${c}] ${pt}${menu}${r}"
                ((c++))
        done
        echo ""
        read -p $'\e[1;37mMenu: \e[0m' mu
        case "${mu}" in
                1)
                        mehf="src/menu_ekstrak_hash_file.sh"
                        if [[ ! -f "${mehf}" ]]; then
                                echo -e "${mt}Script ini tidak bisa dijalankan karena file '${mehf}' tidak ditemukan.${r}"
                                echo ""
                                read -p $'\e[1;37mTekan [\e[1;32mEnter\e[1;37m] untuk keluar...\e[0m' 
                                exit 1
                        else
                                bash "${mehf}"
                        fi
                        ;;
                2)
                        mbdks="src/menu_buat_daftar_kata_sandi.sh"
                        if [[ ! -f "${mbdks}" ]]; then
                                echo -e "${mt}Script ini tidak bisa dijalankan karena file '${mbdks}' tidak ditemukan.${r}"
                                echo ""
                                read -p $'\e[1;37mTekan [\e[1;32mEnter\e[1;37m] untuk keluar...\e[0m' 
                                exit 1
                        else
                                bash "${mbdks}"
                        fi
                        ;;
                3)
                        mdw="src/menu_download_wordlist.sh"
                        if [[ ! -f "${mdw}" ]]; then
                                echo -e "${mt}Script ini tidak bisa dijalankan karena file '${mdw}' tidak ditemukan.${r}"
                                echo ""
                                read -p $'\e[1;37mTekan [\e[1;32mEnter\e[1;37m] untuk keluar...\e[0m' 
                                exit 1
                        else
                                bash "${mdw}"
                        fi
                        ;;
                4)
                        # menu pulihkan kata sandi file
                        mpksf="src/menu_pulihkan_kata_sandi_file.sh"
                        if [[ ! -f "${mpksf}" ]]; then
                                echo -e "${mt}Script ini tidak bisa dijalankan karena file '${mpksf}' tidak ditemukan.${r}"
                                echo ""
                                read -p $'\e[1;37mTekan [\e[1;32mEnter\e[1;37m] untuk keluar...\e[0m' 
                                exit 1
                        else
                                bash "${mpksf}"
                        fi
                        ;;
                5)
                        exit 0
                        ;;
                *)
                        echo -e "${mt}Menu '${mu}' tidak tersedia. Silahkan pilih menu yang tersedia.${r}"
                        echo ""
                        read -p $'\e[1;37mTekan [\e[1;32mEnter\e[1;37m] untuk melanjutkan...\e[0m'
                        continue 
                        ;;
                 
        esac
done
