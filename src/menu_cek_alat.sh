#!/bin/bash
# [menu_cek_alat.sh]
# file ini merupakan salah satu file dari projek FPR

# variabel warna 
hm="\e[0;32m" # hijau muda
ht="\e[1;32m" # hijau terang 
ut="\e[1;35m" # ungu terang
mt="\e[1;31m" # merah terang
kt="\e[1;33m" # kuning terang 
bt="\e[1;34m" # biru terang 
r="\e[0m"

clear
echo -e "${hm}******************** Selamat datang ********************${r}"
echo -e "${ut}Program ini hanya untuk tujuan edukasi dan pembelajaran.${r}"
echo ""
echo -e "${bt}Mari kita periksa apakah Anda sudah menginstal alat-alat yang dibutuhkan oleh skrip ini.${r}"
read -p "Tekan [Enter] untuk melanjutkan..."
echo ""

# daftar alat penting
dap=(
        "/opt/JohnTheRipper/run/john"
        "/opt/hashcat/hashcat"
)

# daftar alat opsional
dao=(
        "/opt/JohnTheRipper/run/zip2john"       # alat untuk mengekstrak hash file zip
        "/opt/JohnTheRipper/run/rar2john"       # alat untuk mengekstrak hash file rar
        "/opt/JohnTheRipper/run/7z2john.pl"     # alat untuk mengekstrak hash file 7z
        "/opt/JohnTheRipper/run/pdf2john.pl"    # alat untuk mengekstrak hash file pdf
        "/opt/JohnTheRipper/run/office2john.py" # alat untuk mengekstrak hash file office (docx, xlxs, pptx)
        "/opt/cupp/cupp.py"
)

# alat penting belum terinstal 
apbt=()

# alat opsional belum terinstal 
aobt=()

# cek alat penting 
echo -e "${bt}Alat penting: memeriksa...${r}"
for ap in "${dap[@]}"; do
        sleep 0.1
        if [[ ! -f "${ap}" ]]; then
            if [[ "${ap}" == "/opt/JohnTheRipper/run/john" ]]; then
                echo -e "${r}john ... ${mt}Error${r}"
                apbt+=("${ap}")
            fi
        elif [[ ! -f "${ap}" ]]; then
            if [[ "${ap}" == "/opt/hashcat/hashcat" ]]; then
                echo -e "${r}hashcat ... ${mt}Error${r}"
                apbt+=("${ap}")
            fi
        else
            if [[ "${ap}" == "/opt/JohnTheRipper/run/john" ]]; then
                echo -e "${r}john ... ${ht}OK${r}"
            elif [[ "${ap}" == "/opt/hashcat/hashcat" ]]; then
                echo -e "${r}hashcat ... ${ht}OK${r}"
            fi
        fi
done

echo ""

# cek alat opsional
echo -e "${bt}Alat opsional: memeriksa...${r}"
for ao in "${dao[@]}"; do
        sleep 0.1
        if [[ ! -f "${ao}" ]]; then
            if [[ "${ao}" == "/opt/JohnTheRipper/run/zip2john" ]]; then
                echo -e "${r}zip2john ... ${mt}Error${r}"
                aobt+=("${ao}")
            elif [[ "${ao}" == "/opt/JohnTheRipper/run/rar2john" ]]; then
                echo -e "${r}rar2john ... ${mt}Error${r}"
                aobt+=("${ao}")
            elif [[ "${ao}" == "/opt/JohnTheRipper/run/7z2john.pl" ]]; then
                echo -e "${r}7z2john ... ${mt}Error${r}"
                aobt+=("${ao}")
            elif [[ "${ao}" == "/opt/JohnTheRipper/run/pdf2john.pl" ]]; then
                echo -e "${r}pdf2john ... ${mt}Error${r}"
                aobt+=("${ao}")
            elif [[ "${ao}" == "/opt/JohnTheRipper/run/office2john.py" ]]; then
                echo -e "${r}office2john ... ${mt}Error${r}"
                aobt+=("${ao}")
            elif [[ "${ao}" == "/opt/cupp/cupp.py" ]]; then
                echo -e "${r}cupp ... ${mt}Error${r}"
                aobt+=("${ao}")
            fi
        else
            if [[ "${ao}" == "/opt/JohnTheRipper/run/zip2john" ]]; then
                echo -e "${r}zip2john ... ${ht}Ok${r}"
            elif [[ "${ao}" == "/opt/JohnTheRipper/run/rar2john" ]]; then
                echo -e "${r}rar2john ... ${ht}OK${r}"
            elif [[ "${ao}" == "/opt/JohnTheRipper/run/7z2john.pl" ]]; then
                echo -e "${r}7z2john ... ${ht}OK${r}"
            elif [[ "${ao}" == "/opt/JohnTheRipper/run/pdf2john.pl" ]]; then
                echo -e "${r}pdf2john ... ${ht}OK${r}"
            elif [[ "${ao}" == "/opt/JohnTheRipper/run/office2john.py" ]]; then
                echo -e "${r}office2john ... ${ht}OK${r}"
            elif [[ "${ao}" == "/opt/cupp/cupp.py" ]]; then
                echo -e "${r}cupp ... ${ht}OK${r}"
            fi
        fi
done

if [[ "${#apbt[@]}" -ne 0 ]]; then
        echo ""
        echo -e "${kt}Script ini tidak bisa dijalankan karena ada alat penting yang belum terinstal.${r}"
        exit 1
fi

if [[ "${#aobt[@]}" -ne 0 ]]; then
        echo ""
        echo -e "${kt}Script ini tidak bisa dijalankan karena ada alat opsional yang belum terinstal.${r}"
        exit 1
fi

echo ""
echo -e "${kt}Semua alat yang diperlukan oleh script ini sudah terinstal. Script ini bisa dijalankan.${r}"
read -p "Tekan [Enter] untuk melanjutkan..."
# file menu_utama.sh
fmu="src/menu_utama.sh"

# mengecek apakah file cek_alat.sh ada atau tidak 
if [[ ! -f "${fmu}" ]]; then   
        echo ""
        echo -e "${kt}Script ini tidak bisa dijalankan karena file '${fmu}' tidak ditemukan.${r}"
        read -p "Tekan [Enter] untuk keluar..."
        exit 1
else
        # menjalankan file cek_alat.sh
        bash "${fmu}"
fi
