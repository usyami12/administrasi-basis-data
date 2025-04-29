SELECT nama_produk, harga FROM produk;-- 1. Menampilkan semua kategori produk
SELECT * FROM kategori;

-- 2. Menampilkan semua supplier
SELECT * FROM supplier;

-- 3. Menampilkan semua produk beserta kategori dan supplier
SELECT p.id_produk, p.nama_produk, k.nama_kategori, s.nama_supplier, p.harga, p.stok
FROM produk p
JOIN kategori k ON p.id_kategori = k.id_kategori
JOIN supplier s ON p.id_supplier = s.id_supplier;

-- 4. Menampilkan semua transaksi beserta data pelanggan
SELECT t.id_transaksi, t.tanggal, t.total, p.nama_pelanggan, p.email
FROM transaksi t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan;

-- 5. Menampilkan detail transaksi untuk transaksi tertentu
SELECT dt.id_detail, dt.jumlah, dt.subtotal, p.nama_produk
FROM detail_transaksi dt
JOIN produk p ON dt.id_produk = p.id_produk
WHERE dt.id_transaksi = 1;  -- Ganti dengan id_transaksi yang diinginkan

-- 6. Menampilkan total pembelian per pelanggan
SELECT p.nama_pelanggan, SUM(t.total) AS total_pembelian
FROM transaksi t
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
GROUP BY p.id_pelanggan;

-- 7. Menampilkan produk yang memiliki stok kurang dari 50
SELECT nama_produk, stok
FROM produk
WHERE stok < 50;

-- 8. Menampilkan transaksi beserta produk yang dibeli
SELECT t.id_transaksi, p.nama_produk, dt.jumlah, dt.subtotal
FROM transaksi t
JOIN detail_transaksi dt ON t.id_transaksi = dt.id_transaksi
JOIN produk p ON dt.id_produk = p.id_produk;

-- 9. Menampilkan jumlah transaksi per kategori produk
SELECT k.nama_kategori, COUNT(t.id_transaksi) AS jumlah_transaksi
FROM transaksi t
JOIN detail_transaksi dt ON t.id_transaksi = dt.id_transaksi
JOIN produk p ON dt.id_produk = p.id_produk
JOIN kategori k ON p.id_kategori = k.id_kategori
GROUP BY k.id_kategori;

-- 10. Menampilkan produk dengan harga tertinggi
SELECT nama_produk, harga
FROM produk
ORDER BY harga DESC
LIMIT 1;