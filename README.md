**LAPORAN ANALISIS WIDGET**
**PROJECT APLIKASI MOBILE: MYSHOP MINI**

**Mata Kuliah:** Mobile Programming
**Platform:** Flutter

### A. Pendahuluan
Aplikasi "MyShop Mini" dibangun menggunakan kerangka kerja Flutter. Struktur antarmuka (UI) disusun menggunakan komposisi *Widget Tree*. Berikut adalah daftar widget utama yang digunakan beserta fungsinya dalam proyek ini.

### B. Daftar Widget dan Fungsi

#### 1. Widget Struktur & Navigasi (Pondasi)
Kelompok widget ini berfungsi sebagai kerangka dasar aplikasi dan halaman.

* **MaterialApp**: Widget induk (root) yang mengatur tema global, font, dan rute navigasi aplikasi.
* **Scaffold**: Struktur dasar visual sebuah halaman yang menyediakan slot untuk *Body*, *AppBar*, dan *BottomNavigationBar*.
* **SafeArea**: Menjaga konten agar tidak tertutup oleh sistem UI perangkat (seperti *notch* kamera atau *status bar*).
* **BottomNavigationBar**: Bilah navigasi di bagian bawah layar untuk berpindah menu (Home, Cart, Profile).

#### 2. Widget Layout (Tata Letak)
Kelompok widget ini berfungsi untuk menyusun posisi elemen UI agar rapi.

* **Column**: Menyusun widget anak (*children*) secara vertikal (dari atas ke bawah). Digunakan untuk menyusun Judul, Banner, dan List Produk.
* **Row**: Menyusun widget anak secara horizontal (menyamping). Digunakan untuk menyusun ikon kategori dan tombol aksi.
* **Stack**: Menumpuk widget di atas widget lain. Digunakan pada halaman Detail untuk menaruh tombol *Back* di atas gambar produk.
* **Container**: Kotak serbaguna untuk membungkus elemen, memberikan warna latar (*background*), bingkai (*border*), dan lengkungan sudut (*radius*).
* **SizedBox**: Memberikan jarak kosong (spasi) tetap, baik secara vertikal maupun horizontal antar elemen.
* **Expanded**: Memerintahkan widget anak untuk mengisi sisa ruang kosong yang tersedia dalam baris (*Row*) atau kolom (*Column*).
* **Center**: Memosisikan widget anak tepat di tengah-tengah area induknya.

#### 3. Widget Daftar & Scroll
Kelompok widget ini menangani konten yang melebihi ukuran layar.

* **SingleChildScrollView**: Membuat tampilan bisa digulir (*scroll*) jika konten lebih panjang dari layar (digunakan di halaman Home).
* **GridView.builder**: Membuat daftar produk dalam format kisi-kisi (grid) 2 kolom secara efisien dan otomatis.

#### 4. Widget Konten & Visual
Kelompok widget ini bertugas menampilkan informasi kepada pengguna.

* **Text**: Menampilkan tulisan (Nama produk, harga, deskripsi).
* **Image.asset**: Menampilkan gambar produk dan logo yang diambil dari folder aset lokal.
* **Icon**: Menampilkan simbol grafis sistem (seperti ikon *Love*, *Search*, *Back*).

#### 5. Widget Interaksi (Fungsional)
Kelompok widget ini menangani respon dari sentuhan pengguna.

* **GestureDetector**: Mendeteksi ketukan jari (*tap*) pada elemen non-tombol (seperti kartu produk) untuk memicu navigasi.
* **IconButton**: Tombol berbentuk ikon yang bisa diklik.
* **TextField**: Kolom input teks yang digunakan untuk fitur pencarian (*Search Bar*).
* **OutlinedButton**: Tombol dengan garis tepi yang digunakan untuk aksi "Add to Cart".

### C. Kesimpulan
Pembangunan antarmuka "MyShop Mini" didominasi oleh penggunaan **Layout Widget** (`Column`, `Row`) untuk struktur, dan **Container** untuk dekorasi visual modern. Penggunaan `GridView.builder` dipilih untuk efisiensi memori dalam menampilkan daftar produk yang dinamis.

---
*Laporan ini disusun sebagai bagian dari dokumentasi penyelesaian soal UTS.*
