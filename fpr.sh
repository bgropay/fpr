#!/bin/bash
# [fpr.shfile ini merupakan salah satu file dari projek FPR

kt="\e[1;33m"
r="\e[0m"

if [[ $(id -u) -ne 0 ]]; then
    echo -e "${kt}Script ini harus dijalani sebagai root.${r}"
    exit 1
fi

# garis yang jelas
function gyj(){
    printf "\r"
}

# animasi karakter 
karakter="/-\|"

# ngulang selama 5 detik 
berakhir=$((SECONDS+7))
while [[ "${SECONDS}" -lt "${berakhir}" ]]; do
    for (( i=0; i<${#karakter}; i++ )); do
        # menampilkan teks loading 
        printf "[*] Memulai FPR %c " "${karakter:$i:1}"
        # menunggu selama 0.1 detik 
        sleep 0.1
        # memanggil fungsi garis yang jelas 
        gyj
    done
done

# Final message after animation
echo "Process completed."
