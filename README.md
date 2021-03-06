# P2_Probstat_D_5025201139
# NO1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas π΄ terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas π΄, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas π΄. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas?

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

C. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas π΄ jika diketahui tingkat signifikansi πΌ = 5% serta H0 : βtidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas π΄β

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
Berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (Ξ±= 0.05)?

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
Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100ΛC, 125ΛC dan 150ΛC) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut:

a. Buatlah plot sederhana untuk visualisasi data
```R
id <- "1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ"
GTL <- read.csv(sprintf("https://docs.google.com/uc?id=%s&export=download", id))
head(GTL)
str(GTL)
```
![image](https://user-images.githubusercontent.com/74358409/174067748-d75c45e9-b938-4012-b590-5050f8c8230b.png)


```R
qplot(x = Temp, y = Light, geom = "point", data = GTL) +
  facet_grid(.~Glass, labeller = label_both)
```
![image](https://user-images.githubusercontent.com/74358409/174068058-90a84266-c1b6-42ff-a267-0c2f6cca417b.png)


b. Lakukan uji ANOVA dua arah
```R
GTL$Glass <- as.factor(GTL$Glass)
GTL$Temp_Factor <- as.factor(GTL$Temp)
str(GTL)
```
![image](https://user-images.githubusercontent.com/74358409/174068195-8ec22157-f1d4-4d0e-b7dd-a57cae62379b.png)

```R
anova <- aov(Light ~ Glass*Temp_Factor, data = GTL)
summary(anova)
```
![image](https://user-images.githubusercontent.com/74358409/174068254-f7b4aa19-6b33-4f58-bb83-9da5ff239402.png)


c. Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
```R
data_summary <- group_by(GTL, Glass, Temp) %>%
  summarise(mean=mean(Light), sd=sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
![image](https://user-images.githubusercontent.com/74358409/174068444-bfbe02f6-3ef1-4f48-b3d7-ab35b876ab35.png)


d. Lakukan uji Tukey
```R
tukey <- TukeyHSD(anova)
print(tukey)
```

e. Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
```R
tukey.cld <- multcompLetters4(anova, tukey)
print(tukey.cld)
```
```R
cld <- as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
data_summary$Tukey <- cld$Letters
print(data_summary)
```
![image](https://user-images.githubusercontent.com/74358409/174068713-2b4b883a-0482-4dbf-87fc-a37ab543da8d.png)
