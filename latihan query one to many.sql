-- Hubungan One to many
-- 1. Tampilkan nama sales representatif untuk setiap pelanggan.
SELECT customerName, CONCAT(firstName," ",lastName) AS NamaLengkap
FROM customers JOIN employees ON salesRepEmployeeNumber = employeeNumber;

-- 2. Tampilkan total pembayaran dari Atelier graphique
SELECT SUM(amount)
FROM customers JOIN payments USING (customerNumber)
WHERE customerName = 'Atelier graphique';

-- 3. Tampilkan total pembayaran per tanggal
SELECT paymentDate,SUM(amount) AS total_pembayaran
FROM payments
GROUP BY paymentDate;

-- 4. Tampilkan produk yang belum pernah terjual
SELECT productCode,productName FROM products
WHERE productCode 
NOT IN (SELECT DISTINCT productCode FROM orderdetails);

SELECT productCode,productName,orderNumber FROM products
LEFT JOIN orderdetails USING (productCode)
WHERE orderNumber IS NULL;

-- 5. Tampilkan jumlah yang terbayar per tiap customer
SELECT customerNumber,customerName,SUM(amount) AS total_terbayar
FROM customers JOIN payments USING (customerNumber)
GROUP BY customerNumber;

-- 6. Berapa order yang sudah pernah dibuat oleh Herkku Gifts
SELECT COUNT(*) AS jumlah_order
FROM customers JOIN orders USING (customerNumber)
WHERE customerName = 'Herkku Gifts';

-- 7. Siapa (saja) karyawan di Boston?
SELECT CONCAT(firstName," ",lastName) AS NamaLengkap
FROM employees JOIN offices USING(officeCode)
WHERE city='Boston';

-- 8. Buat daftar pelanggan yang lebih dari $ 100.000. Urutkan daftar tersebut sehingga pelanggan yang melakukan pembayaran tertinggi muncul lebih dulu.
SELECT customerName, amount
FROM customers JOIN payments USING (customerNumber)
WHERE amount > 100000
ORDER BY amount DESC;

-- 9. Tampilkan nilai dari order yang statusnya 'On Hold'
SELECT orderNumber,SUM(quantityOrdered*priceEach) AS nilai_order
FROM orders JOIN orderdetails USING (orderNumber)
WHERE status = 'On Hold'
GROUP BY orderNumber;

-- 10. Tampilkan jumlah order 'On Hold' untuk tiap customer
SELECT customerName,COUNT(*) AS StatusOnHold
FROM customers JOIN orders USING (customerNumber)
WHERE status = 'On Hold'
GROUP BY customerNumber;