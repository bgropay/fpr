# [ banner.py ]

import os
try:
        from colorama import Fore
except ImportError as e:
        print(e)
        exit(1)

h = Fore.LIGHTGREEN_EX   # Warna Hijau 
m = Fore.LIGHTRED_EX     # Warna Merah 
r = Fore.RESET           # Reset Warna 

os.system("clear")

print(f"""
{h}-------------------------------------------------------------------------------{r}
{h};::::.. . . .    ..oedMMVMMMMbeo.    .   .     .        {m}Script ini dibuat hanya{r} 
{h}:::.. . . .  ..!!!!eMMMMVMMMNWWUUX.    .    .     .{r}
{h}:.. . .  . -!<- .edMMMMMIMMMMMMMMMMMo    .     .     .   . {m}untuk tujuan edukasi {r}
{h}: . .  ,~   ~::WMMMMMMMMIMMMMMMMMMMMVMu     .     .               .         .{r}
{h}. .  .      ::dUUUUMUMMM!MMMMMMMMMMMVMMM:      .     .       .{r}
{h}.   '     .::dUUUUUUUUUM!MMMMMMMMMMVVMMMR   .     .      .     {m}dan pembelajaran {r}
{h}.  '      .::UUUUUUUUUUMUMMMMMMMMMVVVVMVVk     .     .{r}
{h}  '      . ':UU''''''ZZZMMMMPP'''''VVZMVV%..      .          .            {m}saja.{r}
{h} :    :. !: dP:'     'ZZZRMX::     `RVVTMF ::::,..   .   .        .{r}
{h} '  :!!!:~!!E!:      sZZBBM9::      dVVVM' ::::;`::                   {m}Tidak ada{r}
{h} ':: `.!!!!!N!..     @WEMEM@k:.     MVVVV``::::! ;:  .       .{r}
{h} !!!!!!(`~~`Mkb.   :@UUR%%MMMu:.   d9VVV* _`::!!         .        .{r}
{h} !!!!!!!!>  'Teeoe@@UUU ! 9MMMMWeee@M**P.'  :!!!  .  .         {m}niat atau maksud {r}
{h} `!!!!!!!      '^##UUU' ! `MR*TTT#TT       !!!!'             .{r}
{h}  !!!!!!         ->.., .   .  .. _{r}
{h}  '      ` .   ,B*'.e$$B$$$$6@Bc 'N,     `     {m}untuk mendorong kegiatan ilegal. {r}
{h}           .  :$f d$$$$$$$$$$$$$c $N..    ;{r}
{h}           := `$>'$$F `#$$$' '$$$ 9$6.^'= ;{r}
{h}            += *L $$   '$$E   3$$ 'I`''-,{r}
{h}            `  '4.$$,  J$$N   @$EzE '' ...{r}
{h}           -*%Ne$@$$b.z$$$$k.z$$$Ph .WP'73&{r}
{h}          td'  ''$$$*' ..LB$$$$$$Ned#`: ^'B'{r}
{h}          #$    '$$F 4B$$Lz/*B$$$$$$BNeunuF{r}
{h}            *=* 3$$6e. '^ .y$@$$'#$$W`'''{r}
{h}                '$$$$$$$$$$P*'   z$$$r{r}
{h}                 '$$$$C''^    .z$$$*B{r}
{h}                   5N$@$$$$W$@$$N$$B'{r}
{h}                    '$$$$$$$$$$$$$*' .{r}
{h}                    , ^*$$$$$$$$#      .{r}
{h}                 ,+'    ''#'''.z6{r}
{h}             ,+ '      J*#b$@$*''        `+{r}
{h}         ,+'          J$$eu...              `  .{r}
""")

e = input("Tekan [Enter] untuk melanjutkan...")
