-- 1. Buat database
CREATE DATABASE IF NOT EXISTS toko_obat_herbal;
USE toko_obat_herbal;

-- 2. Tabel pembeli
CREATE TABLE pembeli (
    id_pembeli INT PRIMARY KEY AUTO_INCREMENT,
    nama_pembeli VARCHAR(100),
    alamat TEXT,
    no_hp VARCHAR(20),
    email VARCHAR(100)
);

-- 3. Tabel karyawan
CREATE TABLE karyawan (
    id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
    nama_karyawan VARCHAR(100),
    posisi VARCHAR(50),
    no_hp VARCHAR(20),
    email VARCHAR(100)
);

-- 4. Tabel produk
CREATE TABLE produk (
    id_produk INT PRIMARY KEY AUTO_INCREMENT,
    nama_produk VARCHAR(100),
    harga DECIMAL(10,2),
    stok INT,
    deskripsi TEXT
);

-- 5. Tabel transaksi (relasi pembeli & karyawan)
CREATE TABLE transaksi (
    id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
    id_pembeli INT,
    id_karyawan INT,
    tanggal DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_pembeli) REFERENCES pembeli(id_pembeli),
    FOREIGN KEY (id_karyawan) REFERENCES karyawan(id_karyawan)
);

-- 6. Tabel detail_transaksi (relasi transaksi & produk)
CREATE TABLE detail_transaksi (
    id_detail INT PRIMARY KEY AUTO_INCREMENT,
    id_transaksi INT,
    id_produk INT,
    jumlah INT,
    subtotal DECIMAL(10,2),
    FOREIGN KEY (id_transaksi) REFERENCES transaksi(id_transaksi),
    FOREIGN KEY (id_produk) REFERENCES produk(id_produk)
);

-- 7. Contoh data pembeli
INSERT INTO pembeli (nama_pembeli, alamat, no_hp, email) VALUES
('Dina Permata', 'Jl. Cemara No.10', '081212345678', 'dina@gmail.com');

-- 8. Contoh data karyawan
INSERT INTO karyawan (nama_karyawan, posisi, no_hp, email) VALUES
('Rudi Santoso', 'Kasir', '082198765432', 'rudi@tokoherbal.com');

-- 9. Contoh data produk
INSERT INTO produk (nama_produk, harga, stok, deskripsi) VALUES
('Kapsul Pegagan', 30000, 100, 'Meningkatkan daya ingat'),
('Teh Daun Sirsak', 25000, 80, 'Menjaga daya tahan tubuh');

-- 10. Contoh transaksi
INSERT INTO transaksi (id_pembeli, id_karyawan, tanggal, total) VALUES
(1, 1, CURDATE(), 55000);

-- 11. Contoh detail transaksi
INSERT INTO detail_transaksi (id_transaksi, id_produk, jumlah, subtotal) VALUES
(1, 1, 1, 30000),
(1, 2, 1, 25000);