#!/bin/bash

#a (file dalam txt random password) b (dimasukkan ke txt)
if [[ $1 =~ ^[a-zA-Z]+$ ]]
then
	cat /dev/urandom| tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1 > `echo $1 | tr -dc 'a-zA-Z'`.txt
else
	echo "error"
fi

#c (enkripsi yg sesuai waktu)

#d (balikin lagi ke $1 namafile.txt nya)



