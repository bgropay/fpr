#!/bin/bash
# [menu_utama.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bm="\e[0;34m" # biru muda
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
    echo -e "${hm}******************** Menu utama FPR ********************${r}"
    echo ""
    echo -e "${ht}Pilih opsi dari menu:${r}"
    echo "----------"
    for menu in "${daftar_menu[@]}"; do
        echo "${c}. ${menu}"
        if [[ "${c}" -eq 5 ]]; then
            echo "----------"
        elif [[ "${c}" -eq 6 ]]; then
            echo "----------"
        elif [[ "${c}" -eq 11 ]]; then
            echo "----------"
        fi
        ((c++))
    done
    read -p ""
done
