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
    "Ekstrak hash file ZIP"
    "Ekstrak hash file RAR"
    "Ekstrak hash file 7z"
    "Ekstrak hash file PDF"
    "Ekstrak hash file Office (docx, xlsx, pptx)"
    "Buat wordlist dengan cupp"
    "Memulihkan kata sandi file ZIP (Membutuhkan hash & wordlist)"
    "Memulihkan kata sandi file RAR (Membutuhkan hash & wordlist)"
    "Memulihkan kata sandi file 7z (Membutuhkan hash & wordlist)"
    "Memulihkan kata sandi file PDF (Membutuhkan hash & wordlist)"
    "Memulihkan kata sandi file Office (docx, xlsx, pptx) (Membutuhkan hash & wordlist)"
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
        if [[ "${c}" -eq 5 ]]; then
            echo -e "${bt}----------${r}"
        elif [[ "${c}" -eq 6 ]]; then
            echo -e "${bt}----------${r}"
        elif [[ "${c}" -eq 11 ]]; then
            echo -e "${bt}----------${r}"
        elif [[ "${c}" -eq 12 ]]; then
            echo -e "${bt}----------${r}"
        fi
        ((c++))
    done
    read -p "" mu
    case "${mu}" in
        1)
            ehfz="ekstrak_hash/ekstrak_hash_file_zip.sh"
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
            bash ekstrak_hash/ekstrak_hash_file_rar.sh
            ;;
        3)
            # ekstrak  hash file 7z
            bash ekstrak_hash/ekstrak_hash_file_7z.sh
            ;;
        4)
            # ekstrak hash file pdf
            bash ekstrak_hash/ekstrak_hash_file_pdf.sh
            ;;
        5)
            # ekstrak hash file office 
            bash ekstrak_hash/ekstrak_hash_file_office.sh
            ;;
    esac
done
