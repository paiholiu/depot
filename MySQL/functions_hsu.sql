/*
DELIMITER $$
CREATE FUNCTION SelectProduct(total INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE str VARCHAR(45);
    IF total >=1000 THEN
		SET str='超級厲害';
	ELSEIF (total>=100) THEN
		SET str='很厲害';
	ELSE
		SET str='一點都不厲害';
	END IF;    
    RETURN (str);
END$$
DELIMITER ;



DELIMITER $$
USE `orderdb`$$
CREATE FUNCTION Hello (name VARCHAR(20))
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
RETURN CONCAT("HELLO " ,name, "午安!");
END$$
DELIMITER ;


DELIMITER $$
USE `orderdb`$$
CREATE FUNCTION `MyUnit`(c decimal(10,1),unit VARCHAR(10)) RETURNS varchar(45) 
    DETERMINISTIC
BEGIN
RETURN CONCAT(c , unit);
END$$
DELIMITER ;
*/


/*
SELECT 
	產品名稱,
    合計,
    SelectProduct(合計)
    FROM 訂單總表; 

SELECT Hello('梅涼欣');


SELECT 產品名稱, 
	   MyUnit(總額, "元") AS 總額, 
       MyUnit(總筆數,'筆') AS 總筆數 
       FROM 產品銷售總表;
      
      
CREATE DEFINER=`root`@`localhost` FUNCTION `ProductSale`(total decimal(10,2)) RETURNS char(1) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE str CHAR(1);
    IF total >=20000 THEN
		SET str='優';
	ELSEIF total>=10000 THEN
		SET str='好';
	ELSEIF total>=5000 THEN
		SET str="可";
	ELSE
		SET str='差';
	END IF;    
    RETURN (str);
END
 
  */
  
# select test2();

#SELECT MyLoop(5);

#SELECT YourLoop(0);

#SELECT ProductSale(4900);

#SELECT 產品名稱,總數量,總筆數,總額, ProductSale(總額) AS 評等 FROM 產品銷售總表 order by 總額 desc;

#SELECT 產品名稱,MyUnit(總額," 元") AS 總額, MyUnit(總筆數, " 筆") AS 總筆數 FROM 產品銷售總表;

#SELECT 銷售人員, CONCAT("NT$ " ,SUM(合計)) AS 銷售總額,CONCAT("NT$ ",SaleBonus(SUM(合計))) AS 獎金
# FROM 訂單總表 GROUP BY 銷售人員 ORDER BY SaleBonus(SUM(合計)) DESC ;

SELECT p1.產品名稱, p1.總額, MyPercent(p1.總額/(SELECT SUM(總額) FROM 產品銷售總表)) AS 佔總額百分比
FROM 產品銷售總表 AS p1, 產品銷售總表 AS  p2
WHERE p1.總額 <= p2.總額 OR (p1.總額=p2.總額 AND p1.產品名稱 = p2.產品名稱)
GROUP BY p1.產品名稱, p1.總額
ORDER BY p1.總額 DESC, p1.產品名稱 DESC;

