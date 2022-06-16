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
H0 : rata-rata Bandung - rata-rata Bali = 0
H1 : rata-rata Bandung - rata-rata Bali != 0

B. Hitung Sampel Statistik
```R
tsum.test(mean.x=3.64, s.x = 1.67, n.x = 19, 
          mean.y =2.79, s.y = 1.32, n.y = 27, 
          alternative = "greater", var.equal = TRUE)
```
![image](https://user-images.githubusercontent.com/74358409/174040188-22f0a090-3adb-4715-a73a-e14b7eecce1f.png)

C. Lakukan Uji Statistik (df =2)
```R
df <- 2
plotDist(dist = 't', df = df)
```
![image](https://user-images.githubusercontent.com/74358409/174039993-2e946461-4813-4b46-a8a8-0fd952b4f11a.png)

D. Nilai Kritikal
```R
qt(p = 0.05, df = 2, lower.tail = FALSE)
[1] 2.919986
```

E. Keputusan
Keputusan : Gagal Tolak H0

F. Kesimpulan
Tidak ada perbedaan pada rata-rata jumlah saham perusahaan di dua kota tersebut

# NO4
A. Buatlah masing masing jenis spesies menjadi 3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
  
  -mengambil data dari link yang telah disediadakan
```R
myFile  <- read.table(url("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt")) 
dim(myFile)
head(myFile)
```

membuat myFile menjadi group, kemudian cek
```R
myFile$Group <- as.factor(myFile$Group)
myFile$Group = factor(myFile$Group,labels = c("Kucing Oren","Kucing Hitam","Kucing Putih"))
```
```R
class(myFile$Group)
```

bagi value menjadi 3 bagian ke 3 grup
```R
group1 <- subset(myFile, Group=="Kucing Oren")
group2 <- subset(myFile, Group=="Kucing Hitam")
group3 <- subset(myFile, Group=="Kucing Putih")
```

B. carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
```R
bartlett.test(Length~Group, data=dataoneway)
```
p-value = 0.8054
bartlett = 0.43292
df = 2

C. Untuk uji ANOVA (satu arah), buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
```R
qqnorm(grup1$Length)
qqline(grup1$Length)
```
![image](https://user-images.githubusercontent.com/74358409/174058104-49f18b51-389e-49fc-9c8e-20c57bac2477.png)

D. Dari Hasil Poin C, Berapakah nilai-p ? , Apa yang dapat Anda simpulkan dari H0?
p-value bernilai 0.8054
H0 diterima

E. Verifikasilah jawaban model 1 dengan Post-hoc test Tukey HSD, dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? J
```R
model1 <- lm(Length~Group, data=myFile)
anova(model1)
TukeyHSD(aov(model1))
```

F. Visualisasikan data dengan ggplot2
```R
ggplot(dataoneway, aes(x = Group, y = Length)) + geom_boxplot(fill = "grey80", colour = "black") + 
scale_x_discrete() + xlab("Treatment Group") +  ylab("Length (cm)")
```
![image](https://user-images.githubusercontent.com/74358409/174058573-ce52eec4-c2a1-4da3-9fd9-957d449a649f.png)


# NO 5
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:

a. Buatlah plot sederhana untuk visualisasi data


b. Lakukan uji ANOVA dua arah


c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)


d. Lakukan uji Tukey


e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey

