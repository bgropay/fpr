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
        "Ekstrak hash file ZIP"
        "Ekstrak hash file RAR"
        "Ekstrak hash file 7z"
        "Ekstrak hash file PDF"
        "Ekstrak hash file Office (docx, xlsx, pptx)"
        "Kembali ke menu utama"
)

c=1

while true; do
        c=1
        clear
        echo -e "${hm}******************** Menu Ekstrak Hash File ********************${r}"
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
        # menu ekstrak hash
        read -p "" mehf
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
                        hash=$(/usr/share/JohnTheRipper/run/./zip2john "${fz}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
                        echo "${hash}" > "${nama_file_hash}"
                        # Memeriksa apakah hash berhasil dibuat
                        if [[ -z "${nama_file_hash}" ]]; then
                                echo -e "${kt}Gagal mengekstrak hash dari file ZIP '${fz}'.${r}"
                                exit 1
                        else
                                echo -e "${ht}Berhasil mengekstrak hash dari file ZIP '${fz}'.${r}"
                                echo -e "${ht}Hash disimpan di dalam file '${nama_file_hash}'.${r}"
                        fi
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                2)
                        # ekstrak hash file rar
                        ehfr="src/ekstrak_hash/ekstrak_hash_file_rar.sh"
                        if [[ ! -f "${ehfr}" ]]; then
                                echo ""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehfr}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${ehfr}"
                        fi
                        ;;
                3)
                        # ekstrak hash file 7z
                        ehf7="src/ekstrak_hash/ekstrak_hash_file_7z.sh"
                        if [[ ! -f "${ehf7}" ]]; then
                                echo ""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehf7}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${ehf7}"
                        fi
                        ;;
                4)
                        # ekstrak hash file pdf
                        ehfp="src/ekstrak_hash/ekstrak_hash_file_pdf.sh"
                        if [[ ! -f "${ehfp}" ]]; then
                                echo ""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehfp}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${ehfp}"
                        fi
                        ;;
                5)
                        # ekstrak hash file office 
                        ehfo="src/ekstrak_hash/ekstrak_hash_file_office.sh"
                        if [[ ! -f "${ehfo}" ]]; then
                                echo""
                                echo -e "${kt}Script ini tidak bisa dijalankan karena file '${ehfo}' tidak ditemukan.${r}"
                                exit 1
                        else
                                bash "${ehfo}"
                        fi
                        ;;
        esac
done
