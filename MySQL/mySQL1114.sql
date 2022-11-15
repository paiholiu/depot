/*
DELIMITER //
CREATE FUNCTION ProductSale(total DECIMAL(10,2))
RETURNS CHAR(1)
DETERMINISTIC
BEGIN
	DECLARE str CHAR(1);
    IF total>=20000 THEN
		SET str='優';
	ELSEIF total>=10000 THEN
		SET str='好';
	ELSEIF total>=5000 THEN
		SET str='可';
	ELSE
		SET str='差';
	END IF;
RETURN (str);
END//
DELIMITER ;
*/

# SELECT 產品名稱, 總數量, 總筆數, 總額, ProductSale(總額) AS 評等 FROM 產品銷售總表 ORDER BY 總額 DESC;

# select ProductSale(5300);

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductSale`()
BEGIN
	SELECT 產品名稱, 總數量, 總筆數, 總額, ProductSale(總額) AS 評等 FROM 產品銷售總表 ORDER BY 總額 DESC;
END
*/

# CALL ProductSale();

/*
DELIMITER //
CREATE FUNCTION SaleTotal(total decimal(10,2))
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
RETURN CONCAT(total, '元');
END//
*/

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `MyUnit`()
BEGIN
	SELECT 產品名稱, MyUnit(總額, "元") AS 總額, MyUnit(總筆數, "筆") AS 總筆數 FROM 產品銷售總表;
END
*/

# CALL MyUnit();

/*
DELIMITER //
CREATE FUNCTION SaleBonus(total DECIMAL(10,2))
RETURNS DECIMAL(10,2) 
DETERMINISTIC
BEGIN
	DECLARE bonus DECIMAL(10,2);
    IF total>100000 THEN
		SET bonus=total*0.2;
	ELSEIF total>=75000 THEN
		SET bonus=total*0.1;
	ELSEIF Total>=50000 THEN
		SET bonus=total*0.05;
	ELSEIF Total>=25000 THEN
		SET bonus=total*0.025;
	ELSE
		SET bonus=0;
	END IF;
	RETURN (bonus);
END//
*/

# SELECT 銷售人員, CONCAT("NT$ ",SUM(合計)) AS 銷售總額, CONCAT("NT$ ", SaleBonus(SUM(合計))) AS 獎金
# FROM 訂單總表 GROUP BY 銷售人員 ORDER BY SaleBonus(SUM(合計)) DESC;

/*
SELECT p1.產品名稱, ROUND(p1.總額,2), CONCAT(ROUND(p1.總額/(SELECT SUM(總額) FROM 產品銷售總表)*100,2), " %") AS 佔總額百分比
FROM 產品銷售總表 AS p1, 產品銷售總表 AS p2
WHERE p1.總額<=p2.總額 OR (p1.總額=p2.總額 AND p1.產品名稱=p2.產品名稱)
GROUP BY p1.產品名稱, p1.總額
ORDER BY p1.總額 DESC, p1.產品名稱 DESC;
*/

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `myPercent`(n DECIMAL(10,4)) RETURNS varchar(10) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE str VARCHAR(10);
    SET str=CONCAT(ROUND(n*100,2), " %");
RETURN str;
END
*/

/*
SELECT p1.產品名稱, ROUND(p1.總額,2), myPercent(p1.總額/(SELECT SUM(總額) FROM 產品銷售總表)) AS 佔總額百分比
FROM 產品銷售總表 AS p1, 產品銷售總表 AS p2
WHERE p1.總額<=p2.總額 OR (p1.總額=p2.總額 AND p1.產品名稱=p2.產品名稱)
GROUP BY p1.產品名稱, p1.
*/

/*觸發
DELIMITER $$
CREATE TRIGGER InsertProduct
AFTER INSERT ON products FOR EACH ROW
BEGIN
	INSERT INTO log
    SET note=CONCAT("新增產品： ", NEW.pid, " / ", NEW.name);
    modifiedTime=NOW();
END $$
DELIMITER ;
*/

# INSERT INTO products (name, unit, price, supplier_id, category_id) VALUES ('科學麵', '每袋5包', 50, 23, 6);

/*
CREATE DEFINER=`root`@`localhost` TRIGGER `UpdateProduct` AFTER UPDATE ON `products` FOR EACH ROW 
BEGIN
	INSERT INTO log
    SET note=CONCAT("更新產品： ", NEW.pid, " / ", NEW.name),
		modifiedTime=NOW();
END
*/

# UPDATE products SET price=159.2 WHERE PID=75;

/*
CREATE DEFINER=`root`@`localhost` TRIGGER `DeleteProduct` AFTER DELETE ON `products` FOR EACH ROW BEGIN
	INSERT INTO log
    SET note=CONCAT("刪除紀錄： ", pid, " / ", name),
		modifiedTime=NOW();
END
*/

# DELETE FROM products WHERE pid=81;

/*
DELIMITER $$
CREATE TRIGGER InsertCategory
AFTER INSERT ON `category` FOR EACH ROW
BEGIN
	INSERT INTO log 
    SET note=CONCAT("新增類別： ", NEW.id, " / ", NEW.category),
    modifiedTime=NOW();
END $$
DELIMITER ;
*/

# CALL InsertCategory('運動用品');