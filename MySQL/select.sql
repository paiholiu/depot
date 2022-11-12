# SELECT * FROM order_detail;
# SELECT * FROM order_detail WHERE qty >=50;
# SELECT * FROM order_detail WHERE qty BETWEEN 20 AND 30;
# SELECT id,qty FROM order_detail WHERE qty BETWEEN 20 AND 30;
# SELECT id AS 訂單編號, qty AS 數量 FROM order_detail WHERE qty BETWEEN 20 AND 30;
# SELECT pid AS 產品編號, name AS 產品名稱, price AS 銷售價格 FROM products WHERE price BETWEEN 20 AND 40;
# SELECT * FROM products WHERE price > 100 OR price < 10 ORDER BY price DESC; #遞減
# SELECT * FROM products WHERE price > 100 OR price < 10 ORDER BY price ASC; #遞增
# SELECT * FROM products WHERE price>=100 OR (price > 10 AND price <=20) ORDER BY price DESC;
# SELECT * FROM order_detail WHERE (qty > 10 AND qty <= 20) OR (qty > 100 AND qty <= 200) ORDER BY qty ASC;
# SELECT * FROM products WHERE category_id IN (1, 3, 5, 7) ORDER BY category_id ASC; #包含
# SELECT * FROM products WHERE unit LIKE '每箱%'; #近似
# SELECT * FROM products WHERE unit LIKE '%公斤' AND category_id IN (2, 4, 6, 8) ORDER BY category_id ASC;
# SELECT * FROM products WHERE name LIKE '%米' AND name NOT LIKE '%玉米' And name NOT Like '蝦%' ORDER BY pid ASC; #不包含
# SELECT * FROM products WHERE name LIKE '%米' AND name NOT IN ('玉米片', '玉米餅', '蝦米') ORDER BY pid ASC;
# SELECT * FROM products WHERE name LIKE '%米' AND category_id=1;
#聚合函數
#SELECT category_id AS 產品名稱, COUNT(category_id) AS 各項類別總數 FROM products GROUP BY category_id;
#條件子句
# SELECT category_id AS 產品名稱, COUNT(category_id) AS 各項類別總數 FROM products GROUP BY category_id HAVING 各項類別總數>=10;
# SELECT category_id AS 產品名稱, COUNT(category_id) AS 各項類別總數 FROM products GROUP BY category_id HAVING COUNT(category_id)>=10;
# SELECT unit AS 以箱為單位, COUNT(unit) AS 總數 FROM products GROUP BY unit HAVING unit LIKE '每箱%';
#INNER JOIN 交集
# SELECT name AS 產品名稱, price AS 價格, qty AS 數量, (price*qty) AS 合計 FROM products INNER JOIN order_detail ON products.pid=order_detail.pid WHERE (price*qty)>=1000;
# SELECT name AS 產品名稱, price AS 價格, SUM(price*qty) AS 總額, SUM(qty) AS 總數量, COUNT(qty) AS 總筆數 FROM products INNER JOIN order_detail ON products.pid=order_detail.pid GROUP BY name;
# SELECT name AS 產品名稱, price AS 價格, SUM(price*qty) AS 總額, SUM(qty) AS 總數量, COUNT(qty) AS 總筆數 FROM products,order_detail WHERE products.pid=order_detail.pid GROUP BY name;
#LEFT jOIN
# SELECT name AS 產品名稱, price AS 價格, SUM(price*qty) AS 總額, SUM(qty) AS 總數量, COUNT(id) AS 總筆數 FROM products LEFT JOIN order_detail ON products.pid=order_detail.pid GROUP BY name;
#RIGHT jOIN
# SELECT name AS 產品名稱, price AS 價格, SUM(price*qty) AS 總額, SUM(qty) AS 總數量, COUNT(id) AS 總筆數 FROM products RIGHT JOIN order_detail ON products.pid=order_detail.pid GROUP BY name;
/*
SELECT name AS 產品名稱, 
	   price AS 價格, 
       qty AS 數量, 
       category AS 類別, 
       (price*qty) AS 合計 
       FROM products INNER JOIN order_detail ON products.pid=order_detail.pid 
       INNER JOIN category ON products.category_id=category.id;
       */
       
SELECT order_detail.id AS 訂單編號,
	   products.pid AS 產品編號,
       products.name AS 產品名稱,
       products.unit AS 單位,
       category AS 類別,
       supplier.name AS 供應商名稱,
       supplier.saleman AS 銷售人員,
       products.price AS 價格,
       order_detail.qty AS 數量,
       (products.price*order_detail.qty) AS 合計
       FROM products INNER JOIN order_detail ON products.pid=order_detail.pid 
       INNER JOIN category ON products.category_id=category.id
       INNER JOIN supplier ON products.supplier_id=supplier.id;

       