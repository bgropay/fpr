#!/bin/bash
# [menu_ekstrak_hash_file.sh]
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
        "Ekstrak hash file ZIP"
        "Ekstrak hash file RAR"
        "Ekstrak hash file 7z"
        "Ekstrak hash file PDF"
        "Ekstrak hash file Office (docx, xlsx, pptx)"
        "Kembali ke menu utama"
)

w=$(date "+%d-%m-%Y %H:%M:%S")

while true; do
        c=1
        clear
        echo -e "${pt}[ ${hm}Menu Ekstrak Hash File ${pt}] [ ${mt}${w} ${pt}]${r}"
        echo ""
        echo -e "${ht}Silahkan pilih menu dibawah ini:${r}"
        echo ""
        for menu in "${daftar_menu[@]}"; do
                echo -e "${kt}[${c}] ${pt}${menu}${r}"
                ((c++))
        done
        # menu ekstrak hash
        echo ""
        read -p $'\e[1;37mMenu: \e[0m' mu
        case "${mehf}" in
                1)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file ZIP: " fz
                                # Memastikan file ZIP yang diberikan ada
                                if [[ ! -f "${fz}" ]]; then
                                        echo -e "${kt}File ZIP '${fz}' tidak ditemukan.${r}"
                                        continue
                                else
                                        if [[ "${fz##*.}" != "zip" ]]; then
                                                echo -e "${kt}File '${fz}' bukan file ZIP.${r}"
                                                continue
                                        else
                                                echo -e "${ht}File ZIP '${fz}' ditemukan.${r}"
                                                break
                                        fi
                                fi
                        done
                        echo ""
                        read -p "Masukkan nama file untuk menyimpan hash file ZIP: " nama_file_hash
                        echo ""
                        echo -e "${bt}Mengekstrak hash dari file ZIP '${fz}'...${r}"
                        sleep 3
                        hash=$(/opt/JohnTheRipper/run/./zip2john "${fz}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file ZIP '${fz}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file ZIP '${fz}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        echo ""
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
                        hash=$(/opt/JohnTheRipper/run/./rar2john "${fr}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file RAR '${fr}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file RAR '${fr}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        echo ""
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
                        hash=$(/opt/JohnTheRipper/run/./7z2john.pl "${f7}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file 7z '${f7}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file 7z '${f7}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        echo ""
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
                        hash=$(/opt/JohnTheRipper/run/./pdf2john.pl "${fp}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file PDF '${fp}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file PDF '${fp}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        echo ""
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
                        hash=$(/opt/JohnTheRipper/run/./office2john.py "${fo}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file Office '${fo}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file Office '${fo}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        echo ""
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                6)
                        fmu="src/menu_utama.sh"
                        if [[ ! -f "${fmu}" ]]; then
                                echo ""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${fmu}' tidak ditemukan.${r}"
                                echo ""
                                read -p "Tekan [Enter] untuk keluar..."
                                exit 1
                        else
                                bash "${fmu}"
                                break
                        fi
                        ;;
                *)
                        echo ""
                        echo -e "${kt}Menu '${mehf}' tidak tersedia. Silahkan pilih menu yang tersedia.${r}"
                        echo ""
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        continue 
        esac
done
