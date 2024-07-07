#!/bin/bash
# [menu_ekstrak_hash_file.sh]
# # file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[0;34m" # biru terang 
r="\e[0m"


daftar_menu=(
        "Pulihkan kata sandi file ZIP"
        "Pulihkan kata sandi file RAR"
        "Pulihkan kata sandi file 7z"
        "Pulihkan kata sandi file PDF"
        "Pulihkan kata sandi file Office (docx, xlsx, pptx)"
        "Kembali ke menu utama"
)

c=1

while true; do
        c=1
        clear
        echo -e "${hm}******************** Menu Pulihkan Kata Sandi File ********************${r}"
        echo ""
        echo -e "${ht}Pilih opsi dari menu:${r}"
        echo -e "${bt}----------${r}"
        for menu in "${daftar_menu[@]}"; do
                echo "${c}. ${menu}"
                if [[ "${c}" -eq 5 ]]; then
                        echo -e "${bt}----------${r}"
                fi
                ((c++))
        done
        # menu pulihkan kata sandi file
        read -p "" mpksf
        pot="cracked.txt"
        case "${mpksf}" in
                1)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file hash dari file ZIP: " fhz
                                # Memastikan file hash dari ZIP yang diberikan ada
                                if [[ ! -f "${fhz}" ]]; then
                                        echo -e "${kt}File hash '${fhz}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File hash '${fhz}' ditemukan.${r}"
                                        break
                                fi
                        done
                        echo ""
                        while true; do
                                read -p "Masukkan nama file daftar kata sandi (Wordlist): " fw
                                # Memastikan file hash dari daftar kata sandi (wordlist) yang diberikan ada
                                if [[ ! -f "${fw}" ]]; then
                                        echo -e "${kt}File daftar kata sandi (Wordlist) '${fw}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File daftar kata sandi (Wordlist) '${fw}' ditemukan.${r}"
                                        break
                                fi
                        done
                        clear
                        /usr/share/JohnTheRipper/run/./john --wordlist="${fw}" --pot="${pot}" "${fhz}"
                        /usr/share/JohnTheRipper/run/./john --show --pot="${pot}" "${fhz}"
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                2)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file RAR: " fr
                                # Memastikan file RAR yang diberikan ada
                                if [[ ! -f "${fr}" ]]; then
                                        echo -e "${kt}File RAR '${fr}' tidak ditemukan.${r}"
                                        continue
                                else
                                        if [[ "${fr##*.}" != "rar" ]]; then
                                                echo -e "${kt}File '${fr}' bukan file RAR.${r}"
                                                continue
                                        else
                                                echo -e "${ht}File RAR '${fr}' ditemukan.${r}"
                                                break
                                        fi
                                fi
                        done
                        echo ""
                        read -p "Masukkan nama file untuk menyimpan hash file RAR: " nama_file_hash
                        echo ""
                        echo -e "${bt}Mengekstrak hash dari file RAR '${fr}'...${r}"
                        sleep 3
                        hash=$(/usr/share/JohnTheRipper/run/./rar2john "${fr}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file RAR '${fr}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file RAR '${fr}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                3)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file 7z: " f7
                                # Memastikan file 7z yang diberikan ada
                                if [[ ! -f "${f7}" ]]; then
                                        echo -e "${kt}File 7z '${f7}' tidak ditemukan.${r}"
                                        continue
                                else
                                        if [[ "${f7##*.}" != "7z" ]]; then
                                                echo -e "${kt}File '${f7}' bukan file 7z.${r}"
                                                continue
                                        else
                                                echo -e "${ht}File 7z '${f7}' ditemukan.${r}"
                                                break
                                        fi
                                fi
                        done
                        echo ""
                        read -p "Masukkan nama file untuk menyimpan hash file 7z: " nama_file_hash
                        echo ""
                        echo -e "${bt}Mengekstrak hash dari file 7z '${f7}'...${r}"
                        sleep 3
                        hash=$(/usr/share/JohnTheRipper/run/./7z2john "${f7}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file 7z '${f7}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file 7z '${f7}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                4)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file PDF: " fp
                                # Memastikan file PDF yang diberikan ada
                                if [[ ! -f "${fp}" ]]; then
                                        echo -e "${kt}File PDF '${fp}' tidak ditemukan.${r}"
                                        continue
                                else        
                                        if [[ "${fp##*.}" != "pdf" ]]; then
                                                echo -e "${kt}File '${fp}' bukan file PDF.${r}"
                                                continue
                                        else
                                                echo -e "${ht}File PDF '${fp}' ditemukan.${r}"
                                                break
                                        fi
                                fi
                        done
                        echo ""
                        read -p "Masukkan nama file untuk menyimpan hash file PDF: " nama_file_hash
                        echo ""
                        echo -e "${bt}Mengekstrak hash dari file PDF '${fp}'...${r}"
                        sleep 3
                        hash=$(/usr/share/JohnTheRipper/run/./pdf2john.pl "${fp}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file PDF '${fp}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file PDF '${fp}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                5)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file Office: " fo
                                # Memastikan file Office yang diberikan ada
                                if [[ ! -f "${fo}" ]]; then
                                        echo -e "${kt}File Office '${fo}' tidak ditemukan.${r}"
                                        continue
                                else
                                        if [[ "${fo##*.}" != "docx" && "${fo##*.}" != "xlsx" && "${fo##*.}" != "pptx" ]]; then
                                                echo -e "${kt}File '${fo}' bukan file Office.${r}"
                                                continue
                                        else
                                                echo -e "${ht}File Office '${fo}' ditemukan.${r}"
                                                break
                                        fi
                                fi
                        done
                        echo ""
                        read -p "Masukkan nama file untuk menyimpan hash file Office: " nama_file_hash
                        echo ""
                        echo -e "${bt}Mengekstrak hash dari file Office '${fo}'...${r}"
                        sleep 3
                        hash=$(/usr/share/JohnTheRipper/run/./office2john.py "${fo}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file Office '${fo}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file Office '${fo}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
        esac
done
