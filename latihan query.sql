-- 1. Tampilkan daftar offices yang diurutkan berdasarkan country, state, dan city.
DESCRIBE offices;
SELECT officeCode,country,state,city
FROM offices
ORDER BY country,state,city;

-- 2. Berapa banyak karyawan (employees) yang ada di perusahaan?
SELECT * FROM employees;
SELECT COUNT(*) FROM employees;

-- 3. Berapa total pembayaran (payments) yang diterima?
SELECT * FROM payments;
SELECT SUM(amount) AS total_bayar FROM payments;
SELECT FORMAT(SUM(amount),0) AS total_bayar FROM payments;

-- 4. Buat daftar lini produk (product lines) yang mengandung 'Cars'.
SELECT * FROM productlines;
SELECT productLine
FROM productlines
WHERE productLine LIKE "%Cars%";

-- 5. Laporkan total pembayaran untuk 28 Oktober 2004.
SELECT * FROM payments;
SELECT SUM(amount) AS total_bayar
FROM payments
WHERE paymentDate='2004-10-28';

-- 6. Laporkan pembayaran yang lebih besar dari $ 100.000.
SELECT * FROM payments;
SELECT *
FROM payments
WHERE amount>100000;

SELECT *
FROM payments
WHERE amount>100000 AND paymentDate='2004-10-28';

-- 7. Buat daftar produk (products) di setiap lini produk.
SELECT * FROM productlines;
SELECT productLine,GROUP_CONCAT(productName)
FROM products
GROUP BY productLine
ORDER BY productLine;

-- 8. Berapa banyak produk di setiap lini produk?
SELECT productLine,COUNT(*) AS banyak_produk
FROM products
GROUP BY productLine;

-- 9. Berapa pembayaran minimum yang diterima?
SELECT * FROM payments;
SELECT MIN(amount) FROM payments;

-- 10. Buat daftar semua pembayaran yang lebih besar dari dua kali pembayaran rata-rata.
SELECT * FROM payments
WHERE amount > 
(SELECT AVG(amount)*2 AS ratarata_pembayaran FROM payments);

-- 11. Berapa rata-rata persentase markup MSRP pada buyPrice.
SELECT AVG(MSRP-buyPrice) AS ratarata_keuntungan
FROM products;
-- 12. Berapa banyak produk yang dijual pada database ClassicModels?
SELECT * FROM products;
SELECT DISTINCT productName FROM products;

-- 13. Laporkan nama dan kota pelanggan yang tidak memiliki perwakilan penjualan (Sales Representative)?
SELECT * FROM customers;
SELECT customerName,city,salesRepEmployeeNumber
FROM customers
WHERE salesRepEmployeeNumber IS NULL;

-- 14. Buat daftar nama eksekutif dengan jabatan VP atau Manajer! Gunakan fungsi CONCAT untuk menggabungkan nama depan dan nama belakang karyawan ke satu kolom
SELECT * FROM employees;
SELECT lastName,firstName,jobTitle
FROM employees
WHERE jobTitle LIKE "%P%" OR jobtitle LIKE "%Manager%";

SELECT CONCAT(firstName,lastName),jobTitle
FROM employees
WHERE jobTitle LIKE "%P%" OR jobtitle LIKE "%Manager%";

-- 15. Pesanan (orders) mana yang memiliki nilai lebih dari $ 5000?
SELECT orderNumber,SUM(priceEach*quantityOrdered) AS total_order 
FROM orderdetails
GROUP BY orderNumber
HAVING total_order>5000;
