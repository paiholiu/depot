

/*
DELIMITER $$
CREATE TRIGGER InsertProduct 
AFTER INSERT ON products FOR EACH ROW
BEGIN
	INSERT INTO log
    SET note=CONCAT("新增產品：",NEW.pid," / ",NEW.name);
END $$

DELIMITER ;

*/

#INSERT INTO products (name,unit,price,supplier_id,category_id) VALUES ('雞塊四兄弟','每袋24包',120.9,5,5);

#PDATE products SET price=90.1 WHERE pid=86;

#DELETE FROM products WHERE pid=86;

CALL InsertCategory('運動用品');