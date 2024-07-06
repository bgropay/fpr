#!/bin/bash
# [menu_utama.sh]
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
    "Ekstrak hash file RAR"
    "Ekstrak hash file 7z"
    "Ekstrak hash file PDF"
    "Ekstrak hash file Office (docx, xlsx, pptx)"
    "Buat wordlist dengan cupp"
    "Memulihkan kata sandi file ZIP (Membutuhkan hash)"
    "Memulihkan kata sandi file RAR (Membutuhkan hash)"
    "Memulihkan kata sandi file 7z (Membutuhkan hash)"
    "Memulihkan kata sandi file PDF (Membutuhkan hash)"
    "Memulihkan kata sandi file Office (docx, xlsx, pptx) (Membutuhkan hash)"
    )

c=1

while true; do
    c=1
    clear
    echo -e "${cm}******************** Menu utama FPR ********************${r}"
    echo ""
    echo -e "${ct}Pilih opsi dari menu:${r}"
    echo -e "${bt}----------${r}"
    for menu in "${daftar_menu[@]}"; do
        echo "${c}. ${menu}"
        if [[ "${c}" -eq 5 ]]; then
            echo -e "${bt}----------${r}"
        elif [[ "${c}" -eq 6 ]]; then
            echo -e "${bt}----------${r}"
        elif [[ "${c}" -eq 11 ]]; then
            echo -e "${bt}----------${r}"
        fi
        ((c++))
    done
    read -p "" mu
    case "${mu}" in
        1)
            bash ekstrak_hash_file_zip.sh
            ;;
    esac
done
