#!/bin/bash
# [ekstrak_hash_file_zip.sh]
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

w=$(date "+%d-%m-%Y %H:%M:%S")
clear
echo -e "${pt}[ ${hm}Ekstrak Hash File Zip ${pt}] [ ${mt}${w} ${pt}]${r}"
echo ""

while true; do
        read -p "Masukkan nama file ZIP: " fz
        # Memastikan file ZIP yang diberikan ada
        if [[ ! -f "${fz}" ]]; then
                echo -e "${kt}File ZIP '${fz}' tidak ditemukan.${r}"
                echo ""
                read -p $'\e[1;37mTekan [\e[1;32mEnter\e[1;37m] untuk melanjutkan...\e[0m'
                continue
        else
                if [[ "${fz##*.}" != "zip" ]]; then
                        echo -e "${kt}File '${fz}' bukan file ZIP.${r}"
                        continue
                else
                        echo -e "${ht}File ZIP '${fz}' ditemukan.${r}"
                        echo ""
                        break
                fi
        fi
done

while true; do
        echo ""
        read -p "Masukkan nama file untuk menyimpan hash file ZIP: " nama_file_hash
        if [[ -z "${nama_file_hash}" ]]; then
                echo -e "${kt}Nama file hash tidak boleh kosong.${r}"
                continue
        fi
done
echo ""
echo -e "${bt}Mengekstrak hash dari file ZIP '${fz}'...${r}"
sleep 3

hash=$(/opt/JohnTheRipper/run/zip2john "${fz}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
echo "${hash}" > "${nama_file_hash}"

# Memeriksa apakah hash berhasil dibuat
if [[ -z "${hash}" ]]; then
        echo -e "${kt}Gagal mengekstrak hash dari file ZIP '${fz}'.${r}"
        exit 1
else
        echo -e "${ht}Berhasil mengekstrak hash dari file ZIP '${fz}'.${r}"
        echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
fi

echo ""
read -p "Tekan [Enter] untuk melanjutkan..."
