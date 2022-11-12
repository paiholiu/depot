# select * from order_detail;
# 列出order_detail中所有攔位

# select * from order_detail where qty>=50;
# 列出order_detail中 qty>=50的項目(列)

# select * from order_detail where qty between 20 and 30;
# 列出order_detail中qty介於20~30之間的項目(列)

# select id,qty from order_detail where qty between 20 and 30;
# 只列出order_detail中qty介於20~30之間的項目並只顯示id跟qty攔位

# select id as 訂單編號 ,qty as 數量 from order_detail where qty between 20 and 30;
# 只列出order_detail中qty介於20~30(包含)之間的項目並設定id顯示為訂單編號，qty顯示為數量攔位

##練習 請列出售價20~40之間的產品，以產品編號顯示PID，以產品顯示NAME，以銷售價格顯示price
# select pid as 產品編號, name as 產品名稱 , price as 銷售價格 from products where price between 20 and 40;

# select * from products where price >100 or price <10 order by price asc;
# 列出products中，price>100或<10的項目，並且以price遞增(asc)排序顯示 (遞減為desc) 

# select * from products where price >=100 or (price >10 and price <=20) order by price desc;
# 列出products中，price=>100或price介於10(不含)~20(包含)的項目，並且以price遞減(desc)排序顯示 

##練習 列出銷售數量為10(不含)~20(包含) 或 100(不含)~200(包含)之間訂單，並以數量遞增排序
# select * from order_detail where (qty > 10 and qty <=20) or (qty >100 and qty <=200) order by qty asc; 

# select * from products where categoryid in(1,3,5,7);
# 列出products中categoryid為1,3,5,7之項目alter

# select * from products where unit like "每箱%";
# 列出products中unit中含有"每箱"的項目 %=萬用字元

# select * from products where unit LIKE "%公斤" and categoryid in(2,4,6,8);
# 列出products中unit中含有"公斤"且categoryid為2,4,6,8的項目

##練習 列出"米"類之產品 但不含玉米餅，玉米片
# select * from products where name like "%米%" and name not like "蝦米" and  name not like "玉米%";
# select * from products where name like "%米%" and name not in("玉米片","玉米餅","蝦米");
# select * from products where name like "%米%" and categoryid=1;

##聚合函數+群組
# select categoryid as 產品類別, count(categoryid) as 類別總數 from products group by categoryid;
# 產品類別顯示為categoryid，類別總數顯示為count(categoryid)，以聚合函數(count())計算總數

# select categoryid as 產品類別, count(categoryid) as 類別總數 from products group by categoryid having 類別總數>=10;
# select categoryid as 產品類別, count(categoryid) as 類別總數 from products group by categoryid having count(categoryid) >=10;
# 聚合函數配上條件子句使用having篩選輸出(類別總數>=10的)

##練習 列出各種以箱為單位之總數
# select unit as 單位, count(unit) as 總數 from products group by unit having unit like "%箱%";

#inner join(交集).兩邊都有的
#1 select name as 產品名稱,price as 價格,qty as 數量,(price * qty) as 合計 
#2 from products inner join order_detail on products.pid=order_detail.pid;
# 選定欄位替代顯示名稱，將produsts連結order_detail計算並顯示

#1 select name as 產品名稱,price as 價格,qty as 數量,(price * qty) as 合計 
#2 from products inner join order_detail on products.pid=order_detail.pid 
#3 where (price * qty)>=1000 ;
# 選定欄位替代顯示名稱，將produsts連結order_detail計算篩選(以where (price * qty)>=1000)後顯示

##練習 輸出計算產品名稱、價格、總額、總數量、總筆數
#1 select name as 產品名稱 ,price as 價格 ,sum(price * qty) as 總額 ,sum(qty) as 總數量 ,count(id) as 總筆數 
#2 from products inner join order_detail on products.pid=order_detail.pid group by name;

#1 select name as 產品名稱 ,price as 價格 ,sum(price * qty) as 總額 ,sum(qty) as 總數量 ,count(id) as 總筆數 
#2 from products , order_detail on products.pid=order_detail.pid group by name;
#簡寫方案(省略inner join)

#left/right join 以哪一邊為主join
#1 select name as 產品名稱 ,price as 價格 ,sum(price * qty) as 總額 ,sum(qty) as 總數量 ,count(id) as 總筆數 
#2 from products left join order_detail on products.pid=order_detail.pid group by name;

#1 select name as 產品名稱 ,price as 價格 ,sum(price * qty) as 總額 ,sum(qty) as 總數量 ,count(id) as 總筆數 
#2 from products inner join order_detail on products.pid=order_detail.pid group by name;

#1 select name as 產品名稱 ,price as 價格 ,sum(price * qty) as 總額 ,sum(qty) as 總數量 ,count(id) as 總筆數 
#2 from products left join order_detail on products.pid=order_detail.pid group by name having SUM(price * qty)>=20000;
#篩選總額>=20000者 以having作為條件子句

#1 select name as 產品名稱,price as 價格,category as 類別, qty as 數量,(price * qty) as 合計 
#2 from products inner join order_detail on products.pid=order_detail.pid
#3 inner join category on products.categoryid=category.id;
#雙重join

##練習 完成完整大表包含:訂單編號/產品編號/產品名稱/單位/類別/供應商名稱/銷售人員/價格/數量/合計
select order_detail.id as 訂單編號, products.pid as 產品編號, products.name as 產品名稱, products.unit as 單位,
	   category.category as 類別, supplier.name as 供應商名稱, supplier.saleman as 銷售人員,
       price as 價格, qty as 數量, (price * qty) as 合計 
from products inner join order_detail on products.pid=order_detail.pid 
inner join category on products.categoryid=category.id
inner join supplier on products.suplierid=supplier.id;