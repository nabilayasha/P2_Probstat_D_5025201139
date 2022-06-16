# P2_Probstat_D_5025201139
# NO1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas?

<img src= https://user-images.githubusercontent.com/74358409/170874495-dce7b56d-bfe2-4507-b6e7-c946d9aa02e7.png width="300">


A.Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas
```R 
data <- data.frame(n,X,Y)
standardev <- sd(x-y)
print(standardev)
```

<img src= https://user-images.githubusercontent.com/74358409/170875750-b03c9f6d-88ee-4c06-8a80-e3239504ccf7.png width="300" >

B. Carilah nilai t (p-value)
```R 
Nilai t(p-value)
t.test(X, Y, alternative = "greater", var.equal = FALSE)
```

C. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

```R
var.test(X, Y)
t.test(X, Y, var.equal = TRUE)
```
# NO2
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer.

A. Apakah Anda setuju dengan klaim tersebut?
```R
Setuju, karena mean > 20000
```

B. Jelaskan maksud dari output yang dihasilkan!
```R
tsum.test(mean.x = 23500, s.x = 3900, n.x = 100,
          alternative = "greater", mu = 20000,
          conf.level = 0.95,  var.equal =  TRUE)
```
![image](https://user-images.githubusercontent.com/74358409/174033128-68377f30-d47f-4584-baf8-990b9a32a60e.png)

C. Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
Rata - rata mobil dikemudikan lebih dari 20.000 km/tahun

# NO3
Berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)?

A. H0 dan H1

B. Hitung Sampel Statistik

C. Lakukan Uji Statistik (df =2)

D. Nilai Kritikal

E. Keputusan

F. Kesimpulan

# NO4
A. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.


B. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?


C. Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.


D. Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?


E. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.


F. Visualisasikan data dengan ggplot2

# NO 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:

a. Buatlah plot sederhana untuk visualisasi data


b. Lakukan uji ANOVA dua arah


c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)


d. Lakukan uji Tukey


e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

