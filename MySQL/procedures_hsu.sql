/*
DELIMITER ##
CREATE PROCEDURE SelectProducts(IN id INT)
BEGIN
	SELECT * FROM  products WHERE pid = id;
END ##



DELIMITER $$
CREATE PROCEDURE SelectOrder(IN id INT)
BEGIN
	SELECT * FROM  order_detail WHERE pid = id;
END $$



DELIMITER $$
CREATE PROCEDURE InsertSupplier()
BEGIN
	INSERT INTO supplier SET
    name = '曾站',
    saleman='艾呆丸';
END $$


DELIMITER $$
CREATE PROCEDURE InsertSupplier2(IN sname VARCHAR(45),
								 IN sman VARCHAR(45))
BEGIN
	INSERT INTO supplier SET
    name = sname,
    saleman=sman;
END $$


USE `orderdb`;
DROP procedure IF EXISTS `InsertCategory2`;
DELIMITER $$
USE `orderdb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertCategory2`(IN cname VARCHAR(45))
BEGIN
	INSERT INTO category SET
    category=cname;
END$$
DELIMITER ;


DELIMITER //
CREATE PROCEDURE SelectOrderAll(
								IN pid INT,
                                OUT total INT)
BEGIN
	SELECT SUM(合計)
    INTO total
    FROM 訂單總表
    WHERE 產品編號=pid;
END//
DELIMITER ;
*/

#CALL SelectProducts(5);
#CALL SelectOrder(42);
#CALL  InsertSupplier();
#CALL  InsertSupplier2('唥囉','哈哇一');
#CALL InsertCategory('南北貨');
#CALL InsertCategory2('東西貨');

#CALL SelectOrderAll(42,@total);
#SELECT @total;
#SELECT @total AS 糙米的銷售總額;

#CALL productSale();
#CALL MyUnit();
#CALL SaleBonus();
#CALL 佔總額百分比();
