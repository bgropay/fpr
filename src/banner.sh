#!/bin/bash
# [ banner.sh ]

t="\e[1;33mPeringatan. \e[1;37mScript ini dibuat hanya untuk tujuan edukasi dan pembelajaran saja. Tidak ada niat atau maksud untuk mendorong kegiatan ilegal.\e[0m"

c=$(cowsay "${t}")

echo -e "${c}"
