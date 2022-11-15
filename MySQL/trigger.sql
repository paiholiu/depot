/*觸發
新增products
DELIMITER $$
CREATE TRIGGER InsertProduct
AFTER INSERT ON products FOR EACH ROW
BEGIN
	INSERT INTO log
    SET note=CONCAT("新增產品： ", NEW.pid, " / ", NEW.name);
END $$
DELIMITER ;
*/

/*更新products
DELIMITER $$
CREATE TRIGGER UpdateProduct
AFTER UPDATE ON products FOR EACH ROW
BEGIN
	INSERT INTO log
    SET note=CONCAT("更新產品： ", NEW.pid, " / ", NEW.name),
		modifiedTime=NOW();
END $$
DELIMITER ;
*/

/* 刪除products
DELIMITER $$
CREATE TRIGGER `DeleteProduct` 
AFTER DELETE ON `products` FOR EACH ROW 
BEGIN
	INSERT INTO log
    SET note=CONCAT("刪除紀錄： ", OLD.pid, " / ", OLD.name),
		modifiedTime=NOW();
END $$
DELIMITER ;
*/

/*新增類別
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
