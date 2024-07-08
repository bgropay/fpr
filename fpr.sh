#!/bin/bash
# [fpr.sh]
# file ini merupakan salah satu file dari projek FPR

# variabel warna 
kt="\e[1;33m"
bt="\e[1;34m"
pt="\e[1;37m"
r="\e[0m"

if [[ $(id -u) -ne 0 ]]; then
        echo -e "${kt}Script ini harus dijalani sebagai root.${r}"
        exit 1
fi

echo -e "${bt}[*] ${pt}Memulai FPR...${r}"
# menunggu selama 5 detik 
sleep 5

# file menu cek_alat.sh
fmca="src/menu_cek_alat.sh"

# mengecek apakah file cek_alat.sh ada atau tidak 
if [[ ! -f "${fmca}" ]]; then
        echo ""
        echo -e "${kt}Script ini tidak bisa dijalankan karena file '${fmca}' tidak ditemukan.${r}"
        exit 1
else
echo "              _            _.,----,"
echo "   __  _.-._ / '-.        -  ,._  \) "
echo "  |  `-)_   '-.   \       / < _ )/' }"
echo "  /__    '-.   \   '-, ___(c-(6)=(6)"
echo "   , `'.    `._ '.  _,'   >\    '  )"
echo "   :;;,,'-._   '---' (  ( '/`. -='/"
echo "  :::::::,  '..__    ,`-.`)'- '--'"
echo "  :::::::::'-._ /'._|   Y/   _/' \"
echo "        ''''._ F    |  _/ _.'._   `\"
echo "               L    \   \/     '._  \"
echo "        .-,-,_ |     `.  `'---,  \_ _|"
echo "        //    'L    /  \,   ('--',=`)7"
echo "       | `._       : _,  \  /'`-._L,_'-._"
echo "       '--' '-.\__/ _L   .`'         './/"
echo "                   [ (  /"
echo "                    ) `{"
echo "                    \__)"
echo ""
        # menjalankan file cek_alat.sh
        bash "${fmca}"
fi
