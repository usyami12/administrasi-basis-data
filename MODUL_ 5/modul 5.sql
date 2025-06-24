-- Nama   : SELKI
-- Modul  : 5
-- Kelas  : PTI/B

-- menggunakan database
USE pti_mart;

-- JOIN
-- menggunakan dua buah tabel berdasarkan kolom yang sama 

-- praktek 1
-- ambil nama prlanggan yang pernah bertransaksi beserta qty nya
-- artinya ambil kolom kode_pelanggan, nama_pelanggan, dan qty dari
-- menggabungkan tabel penjualan dan tabel pelanggan

SELECT kode_pelanggan, nama_pelanggan, tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;

-- prakteK 2
-- menggabungkan dua tabel tanpa memperhatikan relational keys
-- ambil nama prlanggan yang pernah bertransaksi beserta qty nya
-- menggabungkan tabel penjualan dan tabel  pelanggan tanpa
-- memperhatikan kolom yang yang menjadi primary key

SELECT 	tp.Kode_pelanggan, ms.nama_pelanggan, tp.qty
FROM tr_penjualan as tp
JOIN ms_pelanggan as mp
ON TRUE; 

-- INNER JOIN 
-- join yang menggambil data dari dua sisi tabel yang berhubungan
-- praktek 3
-- dari hasil join tabel penjualan dan tabel pelanggan
SELECT tp.kode_pelanggan, mp. nama_pelanggan, tp.nama_produk, tp.qty
FROM tr_penjualan as tp
INNER JOIN ms_pelanggan as mp
ON tp.kode_pelanggan = mp.kode_pelanggan;  

-- Latihan Mandiri
-- 1. Buatlah join untuk ketiga table yang terdapat pada dqlabmartbasic dengan INNER JOIN
SELECT * FROM ms_pelanggan p
JOIN tr_penjualan t
JOIN ms_produk pr ON TRUE;

-- 2. Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan, dan ms_produk yang terdapat pada dqlabmartbasic 
-- dengan LEFT JOIN, kemudian filter untuk qty yang tidak bisa bernilai NULL dengan operator IS NOT NULL
SELECT p.kode_pelanggan, p.nama_pelanggan, t.kode_transaksi, t.tgl_transaksi, t.qty, pr.kode_produk, pr.nama_produk, pr.kategori_produk,
    pr.harga AS harga_produk
FROM ms_pelanggan p
LEFT JOIN tr_penjualan t ON p.kode_pelanggan = t.kode_pelanggan
LEFT JOIN ms_produk pr ON t.kode_produk = pr.kode_produk
WHERE t.qty IS NOT NULL;
    
-- 3. Buatlah join untuk ketiga table dengan urutan ms_pelanggan, tr_penjualan, dan ms_produk yang terdapat pada dqlabmartbasic
-- dengan INNER JOIN, kemudian tampilkan grouping untuk kolom kategori produk dan penjumlahan qty
SELECT pr.kategori_produk, SUM(t.qty) AS total_qty FROM ms_pelanggan AS p
INNER JOIN 
    tr_penjualan AS t ON p.kode_pelanggan = t.kode_pelanggan
INNER JOIN ms_produk AS pr ON t.kode_produk = pr.kode_produk
GROUP BY pr.kategori_produk;
    
-- 4. LATIHAN KHUSUS:Cobalah lakukan JOIN ms_produk dengan table ms_produk juga dengan kolom relationship
-- kode_produk (benar, Anda tidak salah baca) - ini kita lakukan join dengan table sendiri yang memang bisa dilakukan, jangan lupa untuk mengganti alias
SELECT a.nama_produk AS produk_utama, b.nama_produk AS produk_sekategori
FROM ms_produk a
JOIN ms_produk b ON a.kategori_produk = b.kategori_produk AND a.kode_produk != b.kode_produk;