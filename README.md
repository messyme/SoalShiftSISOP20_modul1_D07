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
- if ($13 != "Region") Setiap baris dicek, jika baris bukan merupakan "Region" atau baris pertama maka baris tersebut adalah baris DataRegion. 
- {DataRegion[$13] += $21} Baris DataRegion pada field ke-21 yang merupakan profit ditambahkan ke dalam array asosiatif yakni field ke-13.
- for (i in DataRegion) {	print DataRegion[i] " " i } } merupakan looping untuk mencetak semua index dan isi dari array
- /home/maisie/Downloads/Sample-Superstore.tsv merupakan lokasi file serta nama file yang datanya diolah pada program ini
- sort -g untuk mengurutkan sesuai dengan bilangan pecahan (-g)
- head -1 untuk mengambil baris teratas saja


#### b) Tampilkan 2 negara bagian (state) yang memiliki keuntungan (profit) paling sedikit berdasarkan hasil poin a
echo "DUA State dengan profit paling sedikit : "
b=$(awk -F"\t" 'NR>1 { DataState[$11] += $21 } 
			END { 
				for (i in DataState) 
					{print DataState[i] " " i }
		}' /home/maisie/Downloads/Sample-Superstore.tsv | sort -g | head -2)
echo "$b"
echo " "
NR adalah *number of fields in current record*. Jadi NR>1 berfungsi agar *number of fields* terhitung dari setelah baris pertama, atau dengan kata lain mengabaikan baris pertama.

#### c)Tampilkan 10 produk (product name) yang memiliki keuntungan (profit) paling sedikit berdasarkan 2 negara bagian (state) hasil poin b
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
