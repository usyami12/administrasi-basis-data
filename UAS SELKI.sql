-- NAMA  : selki debei usyami
-- NIM   : 23241074
-- KELAS  : PTI.b
-- MATA KULIAH  : administrasi basis data

-- SOAL 1
/*Munculkan nama produk, tgl transaksi, bulan, tahun, dan selisih hari dari transaksi dengan tgl 30 juni 2023 atas semua produk ditransaksi
  
  -- ambil nama produk, tgl transaksi, bulan, tahun, dan selisih;
  -- ambil tgl transaksi, bulan, tahun dan selisih;
  SELECT
  
    nama_produk,
    tgl_transaksi,
    MONTH(tgl_transaksi) AS bulan,
    YEAR(tgl_transaksi) AS tahun,
    DATEDIFF('2023-06-30', tgl_transaksi) AS selisih_hari
FROM
    transaksi;
    
   -- Ambil nama produk, tgl transaksi, bulan, tahun, dan selisih hari dari transaksi;
   -- Ambil transaksi, bulan, tahun, dan selisih dari transaksi;
    SELECT
    nama_produk,
    tgl_transaksi,
    MONTH(tgl_transaksi) AS bulan,
    YEAR(tgl_transaksi) AS tahun,
    DATEDIFF(DAY, tgl_transaksi, '2023-06-30') AS selisih_hari
FROM
    transaksi;
    
    soal 2
    /*Tampilkan nama pelanggan dan nilai transaksinya dengan nilai transaksi terkecil
    
-- SELECT
-- np. nama,pelanggan
-- NIM (tp,qty * tp.harga) AS teransaksi_terkecil
-- FROM tr penjualan tp
-- JOIN ms_pelanggan mp
-- ON tp_kode pelanggan = mp kode_pelanggan; 

    soal 3
    /*Tampilkan bulan, nama, produk, kategori. dan harga dari produk yang tidak pernah terjual pada bulan mei
    
    SELECT 
    'Mei' AS bulan,
    p.nama_produk,
    p.kategori,
    p.harga
FROM produk p
WHERE p.id_produk NOT IN (
    SELECT dt.id_produk
    FROM detail_transaksi dt
    JOIN transaksi t ON dt.id_transaksi = t.id_transaksi
    WHERE MONTH(t.tanggal_transaksi) = 5
);


