/*
DELIMITER ##
CREATE PROCEDURE SelectProducts(IN id INT)
BEGIN
	SELECT * FROM products WHERE pid=id;
END ##
*/

/*
DELIMITER $$
CREATE PROCEDURE SelectOrder(IN id INT)
BEGIN
	SELECT * FROM order_detail WHERE pid=id;
END $$
*/

/*
DELIMITER $$
CREATE PROCEDURE InsertSupplier()
BEGIN
	INSERT INTO supplier SET
    name = '曾站',
    saleman = '艾呆丸';
END $$
*/

/*
DELIMITER $$
CREATE PROCEDURE InsertSupplier2(IN sname VARCHAR(45),
								 IN sman VARCHAR(45))
BEGIN
	INSERT INTO supplier SET
    name = sname,
    saleman = sman;
END $$
*/

/*
USE `orderdb`;
DROP procedure IF EXISTS `InsertCategory`;

DELIMITER $$
USE `orderdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCategory`(IN categoryname VARCHAR(45))
BEGIN
	INSERT INTO category SET
    category=categoryname;
END$$

DELIMITER ;
;
*/

/*
DELIMITER //
CREATE PROCEDURE `SelectOrderAll`(IN pid INT,
								  OUT total INT)
BEGIN
	SELECT SUM(合計)
    INTO total
    FROM 訂單總表
    WHERE 產品編號=pid;
END//

DELIMITER ;
*

# CALL SelectProducts(5);

# CALL SelectOrder(42);InsertSuppliersupplier

# CALL InsertSupplier(); 

# CALL InsertSupplier2('哈囉','哈哇一');

# CALL InsertCategory('南北貨');

# CALL InsertCategory('東西貨');

# CALL SelectOrderAll(42,@total);
# SELECT @total;
# SELECT @total AS 糙米的銷售總額;

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProductSale`()
BEGIN
	SELECT 產品名稱, 總數量, 總筆數, 總額, ProductSale(總額) AS 評等 FROM 產品銷售總表 ORDER BY 總額 DESC;
END
*/

# CALL ProductSale();

/*
CREATE DEFINER=`root`@`localhost` PROCEDURE `MyUnit`()
BEGIN
	SELECT 產品名稱, MyUnit(總額, "元") AS 總額, MyUnit(總筆數, "筆") AS 總筆數 FROM 產品銷售總表;
END
*/

# CALL MyUnit();

/*
DELIMITER //
CREATE PROCEDURE `佔總額百分比`()
BEGIN
SELECT p1.產品名稱, ROUND(p1.總額,2), CONCAT(ROUND(p1.總額/(SELECT SUM(總額) FROM 產品銷售總表)*100,2), " %") AS 佔總額百分比
FROM 產品銷售總表 AS p1, 產品銷售總表 AS p2
WHERE p1.總額<=p2.總額 OR (p1.總額=p2.總額 AND p1.產品名稱=p2.產品名稱)
GROUP BY p1.產品名稱, p1.總額
ORDER BY p1.總額 DESC, p1.產品名稱 DESC;
END //
DELIMITER ;
*/