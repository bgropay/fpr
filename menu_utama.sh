#!/bin/bash
# [menu_utama.sh]
# # file ini merupakan salah satu file dari projek FPR

daftar_menu=(
    "Ekstrak hash file ZIP"
    "Ekstrak hash file RAR"
    "Ekstrak hash file 7z"
    "Ekstrak hash file PDF"
    "Ekstrak hash file Office (docx, xlsx, pptx)"
    )

c=1

while true; do
    echo "******************** Menu utama FPR ********************"
    echo ""
    echo "Pilih opsi dari menu:"
    echo "----------"
    for menu in "${daftar_menu[@]}"; do
        echo "${c}. ${menu}"
        if [[ "${c}" -eq 5 ]]; then
            echo "----------"
        fi
        ((c++))
    done
    read -p ""
done
