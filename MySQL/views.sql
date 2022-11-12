/*
CREATE VIEW 數量大於等於50
AS
SELECT * FROM order_detail WHERE qty >=50;
*/

/*
CREATE VIEW 訂單明細
AS
SELECT id AS 訂單編號,
pid AS 產品編號,
qty AS 數量
FROM order_detail;

CREATE VIEW 產品
AS
SELECT pid AS 產品編號,
name AS 產品名稱,
unit AS 單位,
price AS 價格,
supplier_id AS 供應商編號,
category_id AS 類別編號
FROM products;

CREATE VIEW 類別
AS
SELECT id AS 編號,
category AS 類別
FROM category;

CREATE VIEW 供應商
AS
SELECT id AS 供應商編號,
name AS 供應商名稱,
saleman AS 銷售人員
FROM supplier;
*/

/*
CREATE VIEW 訂單總表
AS
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
       */
       

CREATE VIEW 產品銷售總表
AS
SELECT name AS 產品名稱,
	   price AS 價格, 
       SUM(price*qty) AS 總額, 
       SUM(qty) AS 總數量, 
       COUNT(id) AS 總筆數 
       FROM products RIGHT JOIN order_detail ON products.pid=order_detail.pid 
       GROUP BY name;
       

