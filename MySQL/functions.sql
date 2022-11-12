/*
DELIMITER //
CREATE FUNCTION SelectProduct(total INT)
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
	DECLARE str VARCHAR(45);
    IF total>1000 THEN
		SET str='宇宙無敵超級厲害';
	ELSEIF (total>500) THEN
		SET str='超級厲害';
	ELSESelectProductsSelectProducts
		SET str='很厲害';
	END IF;
RETURN (str);
END//
DELIMITER ;
*/

# SELECT 產品名稱, SelectProduct(合計) From 訂單總表;

/*
DELIMITER //
CREATE FUNCTION f(name VARCHAR(45))
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
RETURN CONCAT('Hello', name, '午安');
END//
*/

# SELECT f('波兒棒老王');

/*
DELIMITER //
CREATE FUNCTION SellTotal(total decimal(10,1))
RETURNS VARCHAR(45)
DETERMINISTIC
BEGIN
RETURN CONCAT(total, '元');
END//
*/

# SELECT 產品名稱, SellTotal(總額) AS 總額 FROM 產品銷售總表;


/*
CREATE DEFINER=`root`@`localhost` FUNCTION `SellTotal`(total DECIMAL(10,1), amount VARCHAR(45)) RETURNS varchar(45) CHARSET utf8mb4
DETERMINISTIC
BEGIN
RETURN CONCAT(total , amount);
END
*/

# SELECT 產品名稱, SellTotal(總額, "元") AS 總額, SellTotal(總筆數, "筆") AS 總筆數 FROM 產品銷售總表;

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `MyLoop`() RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE VAR INT;
    SET VAR=1;
    MyLabel: LOOP
    
		IF VAR <10 THEN
			ITERATE MyLabel;
		END IF;
        
        LEAVE MyLabel;
        
	END LOOP MyLabel;
RETURN 1;
END
*/

# SELECT MyLoop();

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `YourLoop`(var INT) RETURNS int
    DETERMINISTIC
BEGIN
    SET var=1;
    MyLabel: LOOP
		SET var= var+1;
		IF VAR <10 THEN
			ITERATE MyLabel;
		END IF;
        
        LEAVE MyLabel;
        
	END LOOP MyLabel;
RETURN 1;
END
*/

# SELECT YourLoop(2);

/*
CREATE DEFINER=`root`@`localhost` FUNCTION `t`(var INT) RETURNS varchar(45) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	declare total int;
    SET total=0;
    MyLoop: LOOP
		SET var=var+1;
        SET total=total+var;
		IF VAR <10 THEN
        iterate MyLoop;
		END IF;
        LEAVE MyLoop;
	END LOOP MyLoop;
RETURN concat("total", total);
END
*/

# SELECT T(0);