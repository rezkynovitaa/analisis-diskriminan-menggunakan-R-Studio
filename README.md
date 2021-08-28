# analisis diskriminan menggunakan R Studio
Analisis Diskriminan merupakan salah satu tehnik analisa Statistika dependensi yang memiliki kegunaan untuk mengklasifikasikan objek beberapa kelompok. Pengelompokan dengan analisis diskriminan ini terjadi karena ada pengaruh satu atau lebih variabel lain yang merupakan variabel independen. Output dari Analisis Diskriminan adalah berupa Model atau persamaan. 
kasus yang dibahas kali ini adalah mengelompokkan mahasiswa apakah mereka bisa dinyatakan lanjut, Drop Out atau pindah dari sebuah sekolah Pasca Sarjana.

Asumsi yang harus terpenuhi dalam analisis diskriminan adalah :
1. Data berdistribusi Normal
2. Bersifat Homoskedastisitas

 ## Uji Normalitas Data
![image](https://user-images.githubusercontent.com/85878732/131215531-3a276d48-963f-4c65-bf53-3dfb6346a1ca.png)

berdasarkan plot yang dihasilkan, terlihat titik cenderung mengikuti garis diagonal data. dapat diasumsikan bahwa data berdistribusi normal. namun, kita bisa mengidentifikasi normalitas menggunakan hasil output dari Multivariatenormality pada nm.mardia.test
![image](https://user-images.githubusercontent.com/85878732/131215612-2a89bcb7-f548-459a-b572-f2754727a2ee.png)

Dari output diatas, terlihat pada bagian $multivariateNormality hasilnya adalah “YES” yang mengartikan bahwa data terdistribusi normal.

## Uji Homoskedastisitas
![image](https://user-images.githubusercontent.com/85878732/131215648-cb1e3045-af67-4be8-a771-2d64a68e20d5.png)
![image](https://user-images.githubusercontent.com/85878732/131215654-cab1d777-be29-4371-b8ae-bd81516c6957.png)

Berdasarkan dari hasil uji homogeneity diperoleh p-value (0.01336) > alpha (0.01) sehingga data bersifat homoskedastisitas

selanjutnya dilakukan pengecekan korelasi dan multikolinieritas antar variabel independen
![image](https://user-images.githubusercontent.com/85878732/131215792-92bce4a2-1531-4965-bce7-3e15a1c3052c.png)

## Uji Wilks Lambda
selanjutnya dilakukan proses Uji Wilks Lambda untuk melihat perbedaan rata-rata skor diskriminan antar kelompok secara multivariat
Hipotesis dalam Uji Wilks Lambda adalah :

H0  : Tidak terdapat perbedaan rata-rata skor diskriminan antar kelompok secara multivariat

H1  : terdapat perbedaan rata-rata skor diskriminan antar kelompok secara multivariat
![image](https://user-images.githubusercontent.com/85878732/131215824-7d476bf9-2b7f-4eb2-b382-6de7264684fa.png)

berdasarkan hasil output, nilai Pr(>F) < Alpha 0.05 yang berarti Tolak H0. artinya, terdapat perbedaan rata-rata skor diskriminan antar kelompok secara multivariat.

## Uji Canonical Discriminant 
Uji ini digunakan untuk melihat hubungan antar variabel diskriminan dengan variabel independen secara multivariat 
![image](https://user-images.githubusercontent.com/85878732/131216068-5b025eca-ada3-452b-9d84-ba35a53dfc83.png)

Terlihat nilai eigen value = 5,64604 yang tidak mendekati 0, berarti tidak terjadi multikolinearitas antar variabel independen. Sementara itu, nilai canonical correlation = 0,84953 atau besarnya CC = (CC)^2 = (0,84953)^2 = 0,7217 atau sebesar 72,17% status pindah, lanjut dan Drop out dijelaskan oleh variabel diskriminan dalam hal ini IPK dan Skor.

# Membuat Model atau Persamaan Diskriminan
![image](https://user-images.githubusercontent.com/85878732/131216112-191e5186-e551-49de-b730-598bb366f428.png)

berdasarkan hasil output, maka persamaan yang terbentuk adalah :

![image](https://user-images.githubusercontent.com/85878732/131216131-b3340a0a-c433-4b15-84db-50777fb36e7a.png)

Kemudian akan dilakukan prediksi untuk menentukan kelas peluang anggota setiap kelas dan diskriminan linear, serta membandingkan data asli dengan data prediksi.
dapat dijalankan dengan syntax sebagai berikut :
![image](https://user-images.githubusercontent.com/85878732/131216201-b67bc62d-b3a0-4415-a314-a1c4074f7787.png)

selanjutnya, kita bisa melihat seberapa banyak kesalahan klasifikasi yang dilakukan oleh model yang terbentuk. 
![image](https://user-images.githubusercontent.com/85878732/131216221-9a65f903-eb8e-4e64-b95c-fd1e27116c93.png)

atau dapat dituliskan dengan:

![image](https://user-images.githubusercontent.com/85878732/131216230-1cea8802-4696-42c5-9000-387286423a69.png)

Dapat disimpulkan bahwa :
1. Kesalahan klasifikasi pada status “Drop” adalah 2 yang kemudian berubah menjadi status “Pindah” dengan persentase kesalahan 7,142% dari total status “ Drop” yang diperoleh
2. Kesalahan klasifikasi pada status “Lanjut” adalah 3 yang kemudian berubah status menjadi “Pindah” dengan persentase kesalahan 9,677% dari total status “ Lanjut” yang diperoleh
3. Kesalahan klasifikasi pada status “Pindah” adalah 2 yang kemudian berubah status menjadi “Drop dan Lanjut” masing-masing berubah menjadi 1 dengan persentase kesalahan 7,692% dari total status “Pindah” yang diperoleh.
