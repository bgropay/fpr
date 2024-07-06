#!/bin/bash
# Judul.......: zpr
# Deskripsi:..: ZIP file password recovery
# Pembuat.....: bgropay
# Penggunaan..: bash zpr.sh

function banner(){
        clear
        echo ""
        echo "d88888D d88888b d8888b  d8888b"
        echo "YP  d8  88      88   8D 88   8D"
        echo "   d8   88ooo   88oodDn 88oobY"
        echo "  d8    88      88      88 8b"
        echo " d8  db 88      88      88  88"
        echo "d88888P YP      88      88   YD"
        echo ""                                                                                
}

function memasukkan_jalur_ke_file_zip(){
        banner
        while true; do
                read -p "Masukkan jalur ke file ZIP: " fz
                # Memastikan file ZIP yang diberikan ada
                if [[ ! -f "${fz}" ]]; then
                        echo "[-] File ZIP '${fz}' tidak ditemukan."
                        continue
                else
                        if [[ "${fz##*.}" != "zip" ]]; then
                                echo "[-] File '${fz}' bukan file ZIP."
                                continue
                        else
                                echo "[+] File ZIP '${fz}' ditemukan."
                                break
                        fi
                fi
        done
}
function ekstrak_hash_dari_file_zip(){
        if ! command -v zip2john >/dev/null 2>&1; then
            echo "[-] Alat zip2john belum terinstal."
            exit 1
        fi

        echo "[*] Mengekstrak hash dari file ZIP '${fz}'..."
        sleep 3

        # Menggunakan zip2john dan cut dalam satu baris perintah untuk ekstraksi hash
        hash=$(zip2john "${fz}" 2>/dev/null | cut -d ':' -f 2 | tr -d '[:space:]')
        nama_file_hash="${fz}_hash.txt"
        echo "${hash}" > "${nama_file_hash}"

        # Memeriksa apakah hash berhasil dibuat
        if [[ -z "${nama_file_hash}" ]]; then
            echo "[-] Gagal mengekstrak hash dari file ZIP '${fz}'."
            exit 1
        else
                echo "[+] Berhasil mengekstrak hash dari file ZIP '${fz}'."
        fi
}

function memasukkan_jalur_ke_file_wordlist(){
        while true; do
                read -p "Masukkan jalur ke file wordlist: " fw
                if [[ ! -f "${fw}" ]]; then
                        echo "[-] File wordlist '${fw}' tidak ditemukan."
                        continue
                else
                        echo "[+] File wordlist '${fw}' ditemukan."
                        break
                fi
        done
}

function memulihkan_kata_sandi_file_zip_dengan_jtr(){
        if grep -o "pkzip" "${nama_file_hash}" >> /dev/null 2>&1; then
                format='PKZIP' # PKZIP   
        elif grep -o "zip2" "${nama_file_hash}" >> /dev/null 2>&1; then
                format='ZIP'
        fi
        john --format="${format}" --wordlist="${fw}" "${nama_file_hash}"
}

function memulihkan_kata_sandi_file_zip(){
        memasukkan_jalur_ke_file_zip
        ekstrak_hash_dari_file_zip
        memasukkan_jalur_ke_file_wordlist
        memulihkan_kata_sandi_file_zip_dengan_hashcat
}

memulihkan_kata_sandi_file_zip
