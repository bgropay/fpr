#!/bin/bash
# [menu_buat_daftar_kata_sandi.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[0;34m" # biru terang 
r="\e[0m"


daftar_menu=(
        "Buat daftar kata sandi (Wordlist) dengan cupp"
        "Kembali ke menu utama"
)

c=1

while true; do
        c=1
        clear
        echo -e "${hm}******************** Menu Membuat Daftar Kata Sandi (Wordlist)  ********************${r}"
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
        # menu buat wordlist
        read -p "" mbdksf
        case "${mbdksf}" in
                1)
                        # membuat daftar kata sandi dengan cupp
                        cupp -i
                        break
                        ;;
                2)
                        fmu="src/menu_utama.sh"
                        if [[ ! -f "${fmu}" ]]; then
                                echo ""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${fmu}' tidak ditemukan.${r}"
                                read -p "Tekan [Enter] untuk melanjutkan..."
                                exit 1
                        else
                                bash "${fmu}"
                                break
                        fi
                        ;;
                *)
                        echo ""
                        echo -e "${kt}Menu '${mbdksf}' tidak tersedia. Silahkan pilih menu yang tersedia.${r}"
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        continue 
                        ;;
        esac
done
