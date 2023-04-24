create database demo;
use demo;
create table Products(
Id int primary key,
productCode varchar(6),
productName varchar(50),
productPrice int,
productAmount int,
productDescription varchar(100),
productStatus bit
);
insert into Products values
(1,"CD1","Aec",60,0,"sdasfg",1),
(2,"AD2","Aec",40,2,"sdfg",0),
(3,"CD3","Aec",50,8,"sdasfg",0),
(4,"VD4","Aec",10,0,"sdsfg",1),
(5,"CD5","Aec",70,5,"sdfg",0),
(6,"VD6","Aec",60,7,"sdfag",0),
(7,"CD7","Aec",100,0,"sdafg",1);
-- tạo unique index 
create unique index proCodeIndex
on Products(productCode);
-- tạo composite Index 
create unique index proName_Price
on products(productName,productPrice);
-- sử dụng explain 
explain select * from Products;
 -- truy vấn nhanh hơn!!!!!!!!!
 -- tao view
 create view ShowProduct as select productCode,ProductName,productPrice,productStatus from Products;
 -- sua view
 update ShowProduct set productPrice=110 where productCode like "CD1";
 -- xoa view 
 drop view ShowProduct;
 -- tao store procedure lay ra tất cả thông tin sản phẩm
 delimiter //
 create procedure ShowAllPro()
 begin
 select * from Products;
 end//
 call ShowAllPro();
 -- Them san pham moi
 delimiter //
create procedure appPro(in id int,proCode varchar(5) , proName varchar(50),price int, amount int ,`Description` varchar(100) ,`status` bit )
 begin
 insert into products value( id, proCode, proName, price, amount,`Description`, `status`);
 end//
 call appPro(8,"CD8","AHc",120,1,"sdafg",0);
 -- sửa thông tin san Pham theo Id
 
 DELIMITER //
 create procedure updateProductById(in uId int)
 
 begin
 update products set productPrice = 130 where Id = uId;
 end //
 DELIMITER ;
 call updateProductById(3);
 -- xoa theo id
  DELIMITER //
 create procedure deleteProductById(in uId int)
 
 begin
 delete from products where id=uId;
 end //
 call deleteProductById(8);