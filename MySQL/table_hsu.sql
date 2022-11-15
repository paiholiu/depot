#建立資料表
CREATE TABLE IF NOT EXISTS order_detail(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
pid INT,
qty INT
);

/*
修改資料表
增加欄位
ALTER TABLE order_detail
ADD COLUMN note VARCHAR(50) NULL,
ADD COLUMN odate DATETIME NULL;
*/


/*
修改資料表
刪除欄位
ALTER TABLE order_detail
DROP COLUMN note;
*/

/*
修改資料表
修改欄位
ALTER TABLE order_detail 
CHANGE COLUMN odate ordate DATETIME NULL DEFAULT NULL ;
*/