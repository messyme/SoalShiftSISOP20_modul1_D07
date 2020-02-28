# SoalShiftSISOP20_modul1_D07

Maisie Chiara Salsabila - 05111840000057
David Bintang - 05111840000090

## Daftar Isi
1. [Nomor 1](#1)
2. [Nomor 2](#2)
	- [Nomor 2a dan 2b](#2ab)
	- [Nomor 2c](#2c)
	- [Nomor 2d](#2d)
3. [Nomor 3](#3)

<a name="1"></a>
## 1. Mengolah Data
### Soal:
Whits adalah seorang mahasiswa teknik informatika. Dia mendapatkan tugas praktikum untuk membuat laporan berdasarkan data yang ada pada file “Sample-Superstore.tsv”.
#### a) Tentukan wilayah bagian (region) mana yang memiliki keuntungan (profit) paling sedikit
```
echo "Region yang memiliki profit paling SEDIKIT : "
a=$(awk -F"\t" '{ if ($13 != "Region")
			 {DataRegion[$13] += $21} }
	END { 
		for (i in DataRegion) {
			print DataRegion[i] " " i } 
	}' /home/maisie/Downloads/Sample-Superstore.tsv | sort -g | head -1)
echo "$a"
echo " "
```
- ```-F "\t"``` pembatas yang digunakan antar kolom adalah tab
- ```if ($13 != "Region")``` Setiap baris dicek, jika baris bukan merupakan ```"Region"``` atau baris pertama maka baris tersebut adalah baris DataRegion. 
- ```{DataRegion[$13] += $21}``` Baris ```DataRegion``` pada field ke-21 yang merupakan profit ditambahkan ke dalam array asosiatif yakni field ke-13.
- ```for (i in DataRegion) { print DataRegion[i] " " i } }``` merupakan looping untuk mencetak semua index dan isi dari array
- ```/home/maisie/Downloads/Sample-Superstore.tsv``` merupakan lokasi file serta nama file yang datanya diolah pada program ini
- ```sort -g``` untuk mengurutkan sesuai dengan bilangan pecahan (-g)
- ```head -1``` untuk mengambil baris teratas saja


#### b) Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
```
echo "DUA State dengan profit paling sedikit : "
b=$(awk -F"\t" 'NR>1 { DataState[$11] += $21 } 
			END { 
				for (i in DataState) 
					{print DataState[i] " " i }
		}' /home/maisie/Downloads/Sample-Superstore.tsv | sort -g | head -2)
echo "$b"
echo " "
```
- ```-F "\t"``` pembatas yang digunakan antar kolom adalah tab
- ```NR``` adalah *number of fields in current record*. Jadi NR>1 berfungsi agar *number of fields* terhitung dari setelah baris pertama, atau dengan kata lain mengabaikan baris pertama.
- ```{DataState[$11] += $21}``` Baris ```DataState``` pada field ke-21 yang merupakan profit ditambahkan ke dalam array asosiatif yakni field ke-11.
- ```for (i in DataState) { print DataState[i] " " i } }``` merupakan looping untuk mencetak semua index dan isi dari array
- ```/home/maisie/Downloads/Sample-Superstore.tsv``` merupakan lokasi file serta nama file yang datanya diolah pada program ini
- ```sort -g``` untuk mengurutkan sesuai dengan bilangan pecahan (-g)
- ```head -2``` untuk mengambil 2 baris teratas saja


#### c)Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b
```
echo "SEPULUH Nama Produk dengan profit paling sedikit berdasarkan poin b : "
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
- ```-F "\t"``` pembatas yang digunakan antar kolom adalah tab
- ```NR``` adalah *number of fields in current record*. Jadi NR>1 berfungsi agar *number of fields* terhitung dari setelah baris pertama, atau dengan kata lain mengabaikan baris pertama.
- ```if ($13 == "Central")``` Setiap baris pada kolom ke-13 dicek, jika baris merupakan ```"Central"```.
- ```if ($11 == "Texas" || $11 == "Illunois")``` Setiap baris pada kolom ke-11 dicek, jika baris merupakan ```"Texas"``` OR ```"Illunois"```.
- ```{DataProduk[$17] += $21}``` Baris ```DataProduk``` pada field ke-21 yang merupakan profit ditambahkan ke dalam array asosiatif yakni field ke-17.
- ```for (i in DataProduk) { print DataProduk[i] " " i } }``` merupakan looping untuk mencetak semua index dan isi dari array
- ```/home/maisie/Downloads/Sample-Superstore.tsv``` merupakan lokasi file serta nama file yang datanya diolah pada program ini
- ```sort -g``` untuk mengurutkan sesuai dengan bilangan pecahan (-g)
- ```head -10``` untuk mengambil 10 baris teratas saja



<a name="2"></a>
## 2. Caesar Cipher
### Soal: 
Pada suatu siang, laptop Randolf dan Afairuzr dibajak oleh seseorang dan kehilangan data-data penting. Untuk mencegah kejadian yang sama terulang kembali mereka meminta bantuan kepada Whits karena dia adalah seorang yang punya banyak ide. Whits memikirkan sebuah ide namun dia meminta bantuan kalian kembali agar ide tersebut cepat diselesaikan. Idenya adalah kalian 
(a) membuat sebuah script bash yang dapat menghasilkan password secara acak sebanyak 28 karakter yang terdapat huruf besar, huruf kecil, dan angka. 
(b) Password acak tersebut disimpan pada file berekstensi .txt dengan nama berdasarkan argumen yang diinputkan dan HANYA berupa alphabet. 
(c) Kemudian supaya file .txt tersebut tidak mudah diketahui maka nama filenya akan di enkripsi dengan menggunakan konversi huruf (string manipulation) yang disesuaikan
dengan jam(0-23) dibuatnya file tersebut dengan program terpisah dengan (misal: password.txt dibuat pada jam 01.28 maka namanya berubah menjadi qbttxpse.txt dengan perintah ‘bash soal2_enkripsi.sh password.txt’. Karena p adalah huruf ke 16 dan file dibuat pada jam 1 maka 16+1=17 dan huruf ke 17 adalah q dan begitu pula seterusnya. Apabila melebihi z, akan kembali ke a, contoh: huruf w dengan jam 5.28, maka akan menjadi huruf b.) dan 
(d) jangan lupa untuk membuat dekripsinya supaya nama file bisa kembali.

<a name="2ab"></a>
#### (a) men-*generate random password* sepanjang 28 karakter  dan (b) disimpan dalam file berekstensi .txt dan nama file hanya berupa alphabet
```
if [[ $1 =~ ^[a-zA-Z]+$ ]]
then
	cat /dev/urandom| tr -dc 'a-zA-Z0-9' | fold -w 28 | head -n 1 > `echo $1 | tr -dc 'a-zA-Z'`.txt
else
	echo "error"
fi
```
- ```if [[ $1 =~ ^[a-zA-Z]+$ ]]``` adalah kondisi agar nama file dengan ekstensi .txt hanya terdiri dari alphabet, jika sesuai kondisi maka akan muncul output ```echo "error"```
- ```=~``` regex berarti menyerupai
- ```^``` regex untuk sebagai *beginning of string*
- ```+``` regex untuk berulang dari 1 (satu) sampai n
- ```$``` regex untuk sebagai penutup string
- ```cat``` adalah command linux dari *concatenate* dimana command ini berfungsi untuk melihat isi file, membuat isi file, dan menggabungkan beberapa teks file menjadi satu teks file.
- ```/dev/urandom``` adalah berfungsi untuk merandom karakter secara *pseurandom*
- ```tr``` adalah dari kata *translate* atau *transliterate*, berfungsing untuk menerjemah, menyalin, atau menghapus suatu karakter
- ```-dc``` adalah gabungan dari ```-d``` untuk delete, ```-c``` untuk complement
- ```tr -dc 'a-zA-Z0-9'``` adalah karakter-karakter yang akan diacak
- ```fold -w``` adalah untuk memberi limit karakter yang akan dihasilkan, misalnya: 28 karakter saja
- ```head -n 1``` maksudnya adalah membuat satu baris string
- ```echo $1 | tr -dc 'a-zA-Z'``` adalah argumen pertama yang akan dijadikan nama file dengan ekstensi .txt
- ```> `echo $1 | tr -dc 'a-zA-Z'`.txt``` melakukan *redirection* (menyimpan output ke file dalam artian menginput hasil *generate* ke dalam file ekstensi .txt)


<a name="2c"></a>
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
- ```grep``` berfungsi sebagai pencari pada suatu text
- ```.``` berarti semua karakter, ```*``` berarti dari 0 sampai n, ```.*``` berarti mengambil semua karakter dari 0 sampai n.
- ```?=``` adalah *positive look ahead* berfungsi untuk membaca kedepan
- ```date +%-H``` menggambil perkiraan waktu setempat dan disimpan ke dalam variabel ```hour```. menggunakan %H karena (00-23)
- ```tr``` adalah dari kata *translate* atau *transliterate*, berfungsing untuk menerjemah, menyalin, atau menghapus suatu karakter
- ```echo $filename | tr ${lower:0:26}${upper:0:26} ${lower:$hour:26}${upper:$hour:26}``` melakukan enkripsi atau pergeseran alfabet sebanyak satu kali dan dilakukan berulang sebanyak variabel ```hour```
- ```mv $1 $rename".txt"``` me-*rename* file tersebut


<a name="2d"></a>
#### (d) dekripsi agar nama file balik lagi kesemula
```
lower='abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz'
upper='ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ'
hour=$(stat -c %y $1 | grep -oP '(?<=[^ ] ).*(?=:.*:)')
name=$(echo "${1%.txt}" | tr ${lower:$hour:26}${upper:$hour:26} ${lower:0:26}${upper:0:26})
mv $1 $name".txt"
```
- ```stat -c %y $1``` mengakses waktu file saat dimodifikasi
- ```stat``` menampilkan atau mengakses informasi detail
- ```-c``` menggunakan format spesifik tertentu bukan format *default*
- ```%y``` waktu terakhir modifikasi atau *time last modified*
- ```grep``` berfungsi sebagai pencari pada suatu text
- ```?<=``` adalah *positive look behind* berfungsi untuk membaca kebelakang
- ```[^ ]``` *matches* semua karakter kecuali spasi
- ```.``` berarti semua karakter, ```*``` berarti dari 0 sampai n, ```.*``` berarti mengambil semua karakter dari 0 sampai n.  
- ```?=``` adalah *positive look ahead* berfungsi untuk membaca kedepan
- ```grep -oP '(?<=[^ ] ).*(?=:.*:)'``` hanya mengambil jam(*hour*)nya
- ```tr ${lower:$hour:26}${upper:$hour:26} ${lower:0:26}${upper:0:26}``` pergeseran alfabet sebanyak satu kali dan dilakukan berulang sebanyak variabel ```hour```
- ```mv $1 $rename".txt"``` me-*rename* file tersebut



<a name="3"></a>
## 3. Kusuma
### Soal:
1 tahun telah berlalu sejak pencampakan hati Kusuma. Akankah sang pujaan hati kembali ke naungan Kusuma? Memang tiada maaf bagi Elen. Tapi apa daya hati yang sudah hancur, Kusuma masih terguncang akan sikap Elen. Melihat kesedihan Kusuma, kalian mencoba menghibur Kusuma dengan mengirimkan gambar kucing.

#### (a) Maka dari itu, kalian mencoba membuat script untuk mendownload 28 gambar dari "https://loremflickr.com/320/240/cat" menggunakan command wget dan menyimpan file dengan nama "pdkt_kusuma_NO" (contoh: pdkt_kusuma_1, pdkt_kusuma_2, pdkt_kusuma_3) serta jangan lupa untuk menyimpan log messages wget kedalam sebuah file "wget.log". Karena kalian gak suka ribet, kalian membuat penjadwalan untuk menjalankan script download gambar tersebut. Namun, script download tersebut hanya berjalan

```
#!/bin/bash
for xxx in {1..28}
do
	wget "https://loremflickr.com/320/240/cat" -O "/home/davtang/pdkt_kusuma_$xxx" -a "/home/davtang/wget.log"
done
```
- ```for xxx in {1..28}``` command untuk melakukan pengulangan sebanyak 28 kali (28 gambar)
- ```wget``` command untuk melakukan download
- ```wget "https://loremflickr.com/320/240/cat" ``` wget untuk mendownload dari web tersebut
- ```-O "/home/davtang/pdkt_kusuma_$xxx"``` destinasi lokasi download serta memberi nama pada file yang didownload dengan format yang diberi.
- ```-a "/home/davtang/wget.log"``` akan ada output di terminal saat proses selesai (log message), maka output tersebut di pindah ke file bernama wget.log 
- ```-a``` agar lognya tersimpan tanpa ter-*replace*

#### (b ) Script download tersebut hanya berjalan setiap 8 jam dimulai dari jam 6.05 setiap hari kecuali hari Sabtu
```
crontab -e
```
```
5 6-23/8 * * 1-5,7 bash /home/davtang/soal3a.sh
```
- ```crontab -e``` membuka window crontab sebagai pengaturan awal pada terminal.
- ```5 6-23/8 * * 1-5,7``` pada crontab, bintang pertama berisi angka 5 yang berarti setiap menit ke 5, 6-23/8 artinya dari jam 6 sampai 11 malam, setiap 8 jam, 1-5,7 artinya setiap hari kecuali hari sabtu (hari ke 6).
- ``` bash /home/davtang/soal3ash``` menjalankan file yang ingin diberi crontab / penjadwalan.

#### (c ) sebuah script untuk mengidentifikasi gambar yang identik dari keseluruhan gambar. Bila terindikasi sebagai gambar yang identik, maka  sisakan 1 gambar dan pindahkan sisa file identik tersebut ke dalam folder ./duplicate       dengan format filename "duplicate_nomor" (contoh : duplicate_200, duplicate_201). Setelah itu lakukan pemindahan semua gambar yang tersisa kedalam folder ./kenangan dengan format filename "kenangan_nomor". Setelah tidak ada gambar dicurrent directory  , maka lakukan backup seluruh log menjadi    ekstensi ".log.bak"
```
#!/bin/bash

grep "Location" wget.log > location.log

for xxx in {1..28}
do
for zzz in {1..28}
do
if [ $xxx -eq $zzz ]
	then
	continue
elif cmp -s "pdkt_kusuma_$xxx" "pdkt_kusuma_$zzz"
	then
	mv pdkt_kusuma_$xxx ./duplicate/duplicate_$xxx
	fi
done
done

for xxx in {1..28}
do
	mv pdkt_kusuma_$xxx ./kenangan/kenangan_$xxx
done
cp wget.log wget.log.bak
```
- ```grep "Location" wget.log > location.log``` grep berfungsi untuk mencari data line, disini yang dicari adalah "Location" dari wget.log , dan dipindah ke location.log dengan overwrite jika sudah ada.
- ```for xxx in {1..28} do``` looping pengulangan 1 gambar
- ```for zzz in {1..28} do``` karena ada 2 gambar yang akan di cek, maka dijadikan double loop.
- ```if [ $xxx -eq $zzz ] then continue``` Di cek, jika angka pada variabel xxx dan zzz sama, maka pengecekan akan dilanjutkan, karena jika sama, berarti kedua gambar tersebut adalah gambar yang sama persis.
- ```elif cmp -s "pdkt_kusuma_$xxx" "pdkt_kusuma_$zzz" then mv pdkt_kusuma_$xxx ./duplicate/duplicate_$xxx``` selain itu, compare (bandingkan) gambar 1 dan lainnya, jika terbukti sama gambarnya, maka yang sama tersebut akan dipindah ke folder duplicate dengan format nama yang tertera.
- ```for xxx in {1..28} do``` melakukan looping untuk command berikutnya
- ```mv pdkt_kusuma_$xxx ./kenangan/kenangan_$xxx``` memindahkan gambar-gambar yang sudah tersaring tadi ke folder kenangan dengan format nama yang tertera.
- ```cp wget.log wget.log.bak``` meng copy isi dari wget.log ke wget.log.bak sebagai back up data.
