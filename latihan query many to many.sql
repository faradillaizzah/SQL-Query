-- Hubungan many to many
-- 1. Buat daftar produk yang dijual berdasarkan tanggal pemesanan.
SELECT productName, orderDate
FROM products JOIN orderdetails USING (productCode) JOIN orders USING (orderNumber)
ORDER BY orderDate;

-- 2. Tampilkan semua order atas produk 1940 Ford Pickup Truck
SELECT orderNumber, orderDate
FROM products JOIN orderdetails USING (productCode) JOIN orders USING (orderNumber)
WHERE productName = '1940 Ford Pickup Truck';

-- 3. Tampilkan nama customer dan order number dimna ordernya memiliki nilai lebih kecil dari 25000
SELECT customerName,orderNumber,SUM(quantityOrdered*priceEach) AS nilai_order
FROM customers JOIN orders USING (customerNumber) JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber
HAVING nilai_order > 25000;

-- 4. Apakah ada produk yang terdapat di setiap ordernya
SELECT productCode,COUNT(*) AS banyak
FROM orderdetails
GROUP BY productCode
HAVING banyak = (SELECT COUNT(*) FROM orders);

-- 5. Tampilkan order yang memiliki harga jual kurang dari MSRP nya
SELECT orderNumber,productName,priceEach,MSRP
FROM products JOIN orderdetails USING (productCode) JOIN orders USING (orderNumber)
WHERE priceEach < MSRP;

-- 6. Laporkan produk yang terjual dengan keuntungan dua kali lipat
SELECT productName,priceEach-buyPrice AS keuntungan,buyPrice
FROM products JOIN orderdetails USING (productCode)
WHERE priceEach-buyPrice < buyPrice;

-- 7. Tampilkan produk yang terjual pada hari senin
SELECT DAYNAME(orderDate),productName
FROM products JOIN orderdetails USING (productCode) JOIN orders USING (orderNumber)
WHERE DAYOFWEEK(orderDate) = 2;

-- 8. Berapa jumlah produk yang masih berstatus 'On Hold'
SELECT SUM(quantityOrdered) AS jumlah_produk
FROM orders JOIN orderdetails USING (orderNumber)
WHERE status = 'On Hold';