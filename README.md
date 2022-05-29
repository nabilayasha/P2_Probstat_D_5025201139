# P2_Probstat_D_5025201139
# NO1
Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas?

<img src= https://user-images.githubusercontent.com/74358409/170874495-dce7b56d-bfe2-4507-b6e7-c946d9aa02e7.png width="300">


## A.Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas
```R 
data <- data.frame(n,X,Y)
standardev <- sd(x-y)
print(standardev)
```

<img src= https://user-images.githubusercontent.com/74358409/170875750-b03c9f6d-88ee-4c06-8a80-e3239504ccf7.png width="300" >

## B. Carilah nilai t (p-value)
```R 
Nilai t(p-value)
t.test(X, Y, alternative = "greater", var.equal = FALSE)
```

## C. Tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

```R
var.test(X, Y)
t.test(X, Y, var.equal = TRUE)
```
