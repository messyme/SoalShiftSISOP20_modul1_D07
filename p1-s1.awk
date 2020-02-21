#!/bin/bash

#1a
echo "Region yang memiliki profit paling SEDIKIT : "
a=$(awk -F"\t" '{ if ($13 != "Region")
			 {DataRegion[$13] += $21} }
	END { 
		for (i in DataRegion) {
			print DataRegion[i] " " i } 
	}' /home/maisie/Downloads/Sample-Superstore.tsv | sort -g | head -1)
echo "$a"
echo " "

#b
echo "DUA State dengan profit paling sedikit : "
b=$(awk -F"\t" 'NR>1 { DataState[$11] += $21 } 
			END { 
				for (i in DataState) 
					{print DataState[i] " " i }
		}' /home/maisie/Downloads/Sample-Superstore.tsv | sort -g | head -2)
echo "$b"
echo " "

#c
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

