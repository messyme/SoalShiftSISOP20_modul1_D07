# SoalShiftSISOP20_modul1_D07

## 1. Mengolah Data
### Soal:
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
#### a) Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit
```echo "Region yang memiliki profit paling SEDIKIT : "
a=$(awk -F"\t" '{ if ($13 != "Region")
			 {DataRegion[$13] += $21} }
	END { 
		for (i in DataRegion) {
			print DataRegion[i] " " i } 
	}' /home/maisie/Downloads/Sample-Superstore.tsv | sort -g | head -1)
echo "$a"
echo " "
```
- ```if ($13 != "Region")``` Setiap baris dicek, jika baris bukan merupakan ```"Region"``` atau baris pertama maka baris tersebut adalah baris DataRegion. 
- ```{DataRegion[$13] += $21}``` Baris ```DataRegion``` pada field ke-21 yang merupakan profit ditambahkan ke dalam array asosiatif yakni field ke-13.
- ```for (i in DataRegion) { print DataRegion[i] " " i } }``` merupakan looping untuk mencetak semua index dan isi dari array
- ```/home/maisie/Downloads/Sample-Superstore.tsv``` merupakan lokasi file serta nama file yang datanya diolah pada program ini
- ```sort -g``` untuk mengurutkan sesuai dengan bilangan pecahan (-g)
- ```head -1``` untuk mengambil baris teratas saja


#### b) Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
```echo "DUA State dengan profit paling sedikit : "
b=$(awk -F"\t" 'NR>1 { DataState[$11] += $21 } 
			END { 
				for (i in DataState) 
					{print DataState[i] " " i }
		}' /home/maisie/Downloads/Sample-Superstore.tsv | sort -g | head -2)
echo "$b"
echo " "
```
- ```NR``` adalah *number of fields in current record*. Jadi NR>1 berfungsi agar *number of fields* terhitung dari setelah baris pertama, atau dengan kata lain mengabaikan baris pertama.
- ```{DataState[$11] += $21}``` Baris ```DataState``` pada field ke-21 yang merupakan profit ditambahkan ke dalam array asosiatif yakni field ke-11.
- ```for (i in DataState) { print DataState[i] " " i } }``` merupakan looping untuk mencetak semua index dan isi dari array
- ```/home/maisie/Downloads/Sample-Superstore.tsv``` merupakan lokasi file serta nama file yang datanya diolah pada program ini
- ```sort -g``` untuk mengurutkan sesuai dengan bilangan pecahan (-g)
- ```head -2``` untuk mengambil 2 baris teratas saja


#### c)Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b
```echo "SEPULUH Nama Produk dengan profit paling sedikit berdasarkan poin b : "
c=$(awk -F"\t" 'NR > 1 {
			if ($13 == "Central") {
				if ($11 == "Texas" || $11 == "Illinois") 
					DataProduk[$17] += $21 
				} 
			} 
				END { 
					for (i in DataProduk) 
						print DataProduk[i] " " i 
					}' /home/maisie/Downloads/Sample-Superstore.tsv | sort -g | head -10)
echo "$c"
```
- ```NR``` adalah *number of fields in current record*. Jadi NR>1 berfungsi agar *number of fields* terhitung dari setelah baris pertama, atau dengan kata lain mengabaikan baris pertama.
- ```if ($13 == "Central")``` Setiap baris pada kolom ke-13 dicek, jika baris merupakan ```"Central"```.
- ```if ($11 == "Texas" || $11 == "Illunois")``` Setiap baris pada kolom ke-11 dicek, jika baris merupakan ```"Texas"``` OR ```"Illunois"```.
- ```{DataProduk[$17] += $21}``` Baris ```DataProduk``` pada field ke-21 yang merupakan profit ditambahkan ke dalam array asosiatif yakni field ke-17.
- ```for (i in DataProduk) { print DataProduk[i] " " i } }``` merupakan looping untuk mencetak semua index dan isi dari array
- ```/home/maisie/Downloads/Sample-Superstore.tsv``` merupakan lokasi file serta nama file yang datanya diolah pada program ini
- ```sort -g``` untuk mengurutkan sesuai dengan bilangan pecahan (-g)
- ```head -10``` untuk mengambil 10 baris teratas saja



## 2. Caesar Cipher
### Soal: 
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian 
(a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 
(b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet. 
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.) dan 
(d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

#### (a) men-*generate random password* sepanjang 28 karakter  dan (b) disimpan dalam file berekstensi .txt dan nama file hanya berupa alphabet
```if [[ $1 =~ ^[a-zA-Z]+$ ]]
then
	cat /dev/urandom| tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1 > `echo $1 | tr -dc 'a-zA-Z'`.txt
else
	echo "error"
fi
```
- ```if [[ $1 =~ ^[a-zA-Z]+$ ]]``` adalah kondisi agar nama file dengan ekstensi .txt hanya terdiri dari alphabet, jika sesuai kondisi maka akan muncul output ```echo "error"```
- ```cat``` adalah command linux dari *concatenate* dimana command ini berfungsi untuk melihat isi file, membuat isi file, dan menggabungkan beberapa teks file menjadi satu teks file.
- ```/dev/urandom``` adalah berfungsi untuk merandom karakter secara *pseurandom*
- ```tr -dc 'a-zA-Z0-9'``` adalah karakter-karakter yang akan diacak
- ```fold -w``` adalah untuk memberi limit karakter yang akan dihasilkan, misalnya: 28 karakter saja
- ```head -n 1``` maksudnya adalah membuat satu baris string
- ```echo $1 | tr -dc 'a-zA-Z'``` adalah argumen pertama yang akan dijadikan nama file dengan ekstensi .txt
- ```> `echo $1 | tr -dc 'a-zA-Z'`.txt``` melakukan *redirection* (menyimpan outpun ke file)


#### (c) enkripsi sesuai waktu
```
lower='abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
upper='ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ'
filename=$(echo $1 | grep -oP '.*(?=\.txt)')
hour=$(date +%-H)
rename=$(echo $filename | tr ${lower:0:26}${upper:0:26} ${lower:$hour:26}${upper:$hour:26})
mv $1 $rename".txt"
```
- ```echo $1 | grep -oP '.*(?=\.txt)'``` mengambil nama file yang merupakan argumen pertama tanpa ekstensi (.txt)
- ```date +%-H``` menggambil perkiraan waktu setempat dan disimpan ke dalam variabel ```hour```. menggunakan %H karena (00-23)
- ```echo $filename | tr ${lower:0:26}${upper:0:26} ${lower:$hour:26}${upper:$hour:26}``` melakukan enkripsi atau pergeseran alfabet sebanyak satu kali dan dilakukan berulang sebanyak variabel ```hour```
- ```mv $1 $rename".txt"``` me-*rename* file tersebut


#### (d) dekripsi agar nama file balik lagi kesemula
