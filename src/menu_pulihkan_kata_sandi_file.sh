#!/bin/bash
# [menu_ekstrak_hash_file.sh]
# # file ini merupakan salah satu file dari projek FPR
#
# Format hash yang baru dibuat error handlingnya:
# - File ZIP [ pkzip, zip ]
# - File RAR [ rar5 ]


# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
mt="\e[1;31m" # merah terang
pt="\e[1;37m" # putih terang 
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
                elif [[ "${c}" -eq 6 ]]; then
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
                                        # Mengecek apakah format hash pkzip atau zip
                                        if grep -i "pkzip" "${fhz}" >> /dev/null 2>&1 || grep -i "zip" "${fhz}" >> /dev/null 2>&1; then
                                                echo -e "${ht}File hash '${fhz}' ditemukan.${r}"
                                                break
                                        else
                                                echo -e "${kt}Format hash yang ada didalam file hash '${fhz}' tidak valid.${r}"
                                                continue 
                                        fi
                                fi
                        done
                        echo ""
                        while true; do
                                read -p "Masukkan nama file Wordlist: " fw
                                # Memastikan file hash dari daftar kata sandi (wordlist) yang diberikan ada
                                if [[ ! -f "${fw}" ]]; then
                                        echo -e "${kt}File Wordlist '${fw}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File Wordlist '${fw}' ditemukan.${r}"
                                        break
                                fi
                        done
                        clear
                        echo -e "${hm}******************** Pulihkan Kata Sandi File ZIP ********************${r}"
                        echo ""
                        /usr/share/JohnTheRipper/run/./john --wordlist="${fw}" --pot="${pot}" "${fhz}"
                        kata_sandi=$(/usr/share/JohnTheRipper/run/./john --show --pot="${pot}" "${fhz}")
                        if [ $? -eq 0 ]; then
                                echo "${kata_sandi}"
                                # Mengambil baris pertama dari output
                                baris_pertama=$(echo "${kata_sandi}" | head -n 1)
    
                                # Memeriksa apakah baris pertama mengandung pemisah ':'
                                if [[ "${baris_pertama}" == *:* ]]; then
                                        # Menampilkan teks di sebelah kanan pemisah ':'
                                        echo ""
                                        echo -e "${ht}[+] ${pt}Kata sandi berhasil dipulihkan.${r}"
                                        echo -e "${ht}[+] ${pt}Kata sandi: ${ht}${baris_pertama#*:}${r}"
                                else
                                        echo ""
                                        echo -e "${mt}[-] ${pt}Kata sandi gagal dipulihkan.${r}"
                                fi
                        fi
                        echo ""
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                2)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file hash dari file RAR: " fhr
                                # Memastikan file hash dari file RAR yang diberikan ada
                                if [[ ! -f "${fhr}" ]]; then
                                        echo -e "${kt}File hash '${fhr}' tidak ditemukan.${r}"
                                        continue
                                else
                                        if grep -i "rar5" "${fhr}" >> /dev/null 2>&1; then
                                                echo -e "${ht}File hash '${fhz}' ditemukan.${r}"
                                                break
                                        else
                                                echo -e "${kt}Format hash yang ada didalam file hash '${fhr}' tidak valid.${r}"
                                                break
                                        fi
                                fi
                        done
                        echo ""
                        while true; do
                                read -p "Masukkan nama file Wordlist: " fw
                                # Memastikan file hash dari daftar kata sandi (wordlist) yang diberikan ada
                                if [[ ! -f "${fw}" ]]; then
                                        echo -e "${kt}File Wordlist '${fw}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File Wordlist '${fw}' ditemukan.${r}"
                                        break
                                fi
                        done
                        clear
                        echo -e "${hm}******************** Pulihkan Kata Sandi File RAR ********************${r}"
                        echo ""
                        /usr/share/JohnTheRipper/run/./john --wordlist="${fw}" --pot="${pot}" "${fhr}"
                        kata_sandi=$(/usr/share/JohnTheRipper/run/./john --show --pot="${pot}" "${fhr}")
                        if [ $? -eq 0 ]; then
                                echo "${kata_sandi}"
                                # Mengambil baris pertama dari output
                                baris_pertama=$(echo "${kata_sandi}" | head -n 1)
    
                                # Memeriksa apakah baris pertama mengandung pemisah ':'
                                if [[ "${baris_pertama}" == *:* ]]; then
                                        # Menampilkan teks di sebelah kanan pemisah ':'
                                        echo ""
                                        echo -e "${ht}[+] ${pt}Kata sandi berhasil dipulihkan.${r}"
                                        echo -e "${ht}[+] ${pt}Kata sandi: ${ht}${baris_pertama#*:}${r}"
                                else
                                        echo ""
                                        echo -e "${mt}[-] ${pt}Kata sandi gagal dipulihkan.${r}"
                                fi
                        fi
                        echo ""
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                3)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file hash dari file 7z: " fh7
                                # Memastikan file hash dari file 7z yang diberikan ada
                                if [[ ! -f "${fh7}" ]]; then
                                        echo -e "${kt}File hash '${fh7}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File hash '${fh7}' ditemukan.${r}"
                                        break
                                fi
                        done
                        echo ""
                        while true; do
                                read -p "Masukkan nama file Wordlist: " fw
                                # Memastikan file hash dari daftar kata sandi (wordlist) yang diberikan ada
                                if [[ ! -f "${fw}" ]]; then
                                        echo -e "${kt}File Wordlist '${fw}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File Wordlist '${fw}' ditemukan.${r}"
                                        break
                                fi
                        done
                        clear
                        echo -e "${hm}******************** Pulihkan Kata Sandi File 7z ********************${r}"
                        echo ""
                        /usr/share/JohnTheRipper/run/./john --wordlist="${fw}" --pot="${pot}" "${fh7}"
                        kata_sandi=$(/usr/share/JohnTheRipper/run/./john --show --pot="${pot}" "${fh7}")
                        if [ $? -eq 0 ]; then
                                echo "${kata_sandi}"
                                # Mengambil baris pertama dari output
                                baris_pertama=$(echo "${kata_sandi}" | head -n 1)
    
                                # Memeriksa apakah baris pertama mengandung pemisah ':'
                                if [[ "${baris_pertama}" == *:* ]]; then
                                        # Menampilkan teks di sebelah kanan pemisah ':'
                                        echo ""
                                        echo -e "${ht}[+] ${pt}Kata sandi berhasil dipulihkan.${r}"
                                        echo -e "${ht}[+] ${pt}Kata sandi: ${ht}${baris_pertama#*:}${r}"
                                else
                                        echo ""
                                        echo -e "${mt}[-] ${pt}Kata sandi gagal dipulihkan.${r}"
                                fi
                        fi
                        echo ""
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                4)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file hash dari file PDF: " fhp
                                # Memastikan file hash dari file PDF yang diberikan ada
                                if [[ ! -f "${fhp}" ]]; then
                                        echo -e "${kt}File hash '${fhp}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File hash '${fhp}' ditemukan.${r}"
                                        break
                                fi
                        done
                        echo ""
                        while true; do
                                read -p "Masukkan nama file Wordlist: " fw
                                # Memastikan file hash dari daftar kata sandi (wordlist) yang diberikan ada
                                if [[ ! -f "${fw}" ]]; then
                                        echo -e "${kt}File Wordlist'${fw}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File Wordlist '${fw}' ditemukan.${r}"
                                        break
                                fi
                        done
                        clear
                        echo -e "${hm}******************** Pulihkan Kata Sandi File PDF ********************${r}"
                        echo ""
                        /usr/share/JohnTheRipper/run/./john --wordlist="${fw}" --pot="${pot}" "${fhp}"
                        kata_sandi=$(/usr/share/JohnTheRipper/run/./john --show --pot="${pot}" "${fhp}")
                        if [ $? -eq 0 ]; then
                                echo "${kata_sandi}"
                                # Mengambil baris pertama dari output
                                baris_pertama=$(echo "${kata_sandi}" | head -n 1)
    
                                # Memeriksa apakah baris pertama mengandung pemisah ':'
                                if [[ "${baris_pertama}" == *:* ]]; then
                                        # Menampilkan teks di sebelah kanan pemisah ':'
                                        echo ""
                                        echo -e "${ht}[+] ${pt}Kata sandi berhasil dipulihkan.${r}"
                                        echo -e "${ht}[+] ${pt}Kata sandi: ${ht}${baris_pertama#*:}${r}"
                                else
                                        echo ""
                                        echo -e "${mt}[-] ${pt}Kata sandi gagal dipulihkan.${r}"
                                fi
                        fi
                        echo ""
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        break
                        ;;
                5)
                        echo ""
                        while true; do
                                read -p "Masukkan nama file hash dari file Office (docx, xlsx, pptx): " fho
                                # Memastikan file hash dari file Office yang diberikan ada
                                if [[ ! -f "${fho}" ]]; then
                                        echo -e "${kt}File hash '${fho}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File hash '${fho}' ditemukan.${r}"
                                        break
                                fi
                        done
                        echo ""
                        while true; do
                                read -p "Masukkan nama file Wordlist: " fw
                                # Memastikan file hash dari daftar kata sandi (wordlist) yang diberikan ada
                                if [[ ! -f "${fw}" ]]; then
                                        echo -e "${kt}File Wordlist '${fw}' tidak ditemukan.${r}"
                                        continue
                                else
                                        echo -e "${ht}File Wordlist '${fw}' ditemukan.${r}"
                                        break
                                fi
                        done
                        clear
                        echo -e "${hm}******************** Pulihkan Kata Sandi File Office (docx, xlsx, pptx) ********************${r}"
                        echo ""
                        /usr/share/JohnTheRipper/run/./john --wordlist="${fw}" --pot="${pot}" "${fho}"
                        kata_sandi=$(/usr/share/JohnTheRipper/run/./john --show --pot="${pot}" "${fho}")
                        if [ $? -eq 0 ]; then
                                echo "${kata_sandi}"
                                # Mengambil baris pertama dari output
                                baris_pertama=$(echo "${kata_sandi}" | head -n 1)
    
                                # Memeriksa apakah baris pertama mengandung pemisah ':'
                                if [[ "${baris_pertama}" == *:* ]]; then
                                        # Menampilkan teks di sebelah kanan pemisah ':'
                                        echo ""
                                        echo -e "${ht}[+] ${pt}Kata sandi berhasil dipulihkan.${r}"
                                        echo -e "${ht}[+] ${pt}Kata sandi: ${ht}${baris_pertama#*:}${r}"
                                else
                                        echo ""
                                        echo -e "${mt}[-] ${pt}Kata sandi gagal dipulihkan.${r}"
                                fi
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
                                read -p "Tekan [Enter] untuk keluar..."
                                exit 1
                        else
                                bash "${fmu}"
                                break
                        fi
                        ;;
                *)
                        echo ""
                        echo -e "${kt}Menu '${mpksf}' tidak tersedia. Silahkan pilih menu yang tersedia.${r}"
                        read -p "Tekan [Enter] untuk melanjutkan..."
                        continue 
                        ;;
        esac
done
