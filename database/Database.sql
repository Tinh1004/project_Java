drop database QuanLyStorePhone

create database QuanLyStorePhone
use		QuanLyStorePhone

	-- bảng t_khachhang
	create table UserDB(
		typeid	int IDENTITY(1,1) PRIMARY KEY,
		userName nvarchar(50),
		userEmail varchar(50),
		userPassword varchar(50),
		CONSTRAINT AK_TransactionID UNIQUE(userEmail),
		userRole BIT DEFAULT 0
	)
	
	insert into UserDB(userName,userEmail,userPassword) values('Pham Ngoc Tinh', 'admin2','123456')

	select * from UserDB 

	Select * from UserDB where userEmail='admin'  and userPassword='123456'

	UPDATE UserDB SET userRole = 1 where typeid = 2

	drop table UserDB

	create table ProductDB(
		id	int IDENTITY(1,1) PRIMARY KEY,
		productName nvarchar(50),
		oldPrice nvarchar(50),
		newPrice nvarchar(50),
		productImage nvarchar(250),
	)

	insert into ProductDB values(N'Điện thoại Samsung Galaxy S22 Ultra 5G 128GB', '','30990000','https://cdn.tgdd.vn/Products/Images/42/235838/galaxy-s22-ultra-white-7.jpg')
	insert into ProductDB values(N'Điện thoại Samsung Galaxy A52s 5G 128GB', '10990000','7990000','https://cdn.tgdd.vn/Products/Images/42/247507/samsung-galaxy-a52s-5g-1-5.jpg')
	insert into ProductDB values(N'Điện thoại iPhone 13 Pro 128GB', '30990000','28390000','https://cdn.tgdd.vn/Products/Images/42/230521/iphone-13-pro-silver-2.jpg')
	drop table ProductDB

	select * from ProductDB where productName = 'Điện thoại Samsung Galaxy S22 Ultra 5G 128GB'

	DELETE FROM ProductDB WHERE id=8;

		UPDATE ProductDB SET productName = 'Le Van Long', oldPrice= '2/10/2001', newPrice = 'true', productImage = 1
		WHERE id = 1;


	create table OrdersDB(
		o_id	int IDENTITY(1,1) PRIMARY KEY,
		p_id int,
		u_id int,
		o_quantity int,
		o_date nvarchar(50)
	)
	drop table OrdersDB

	insert into OrdersDB values(1,1,2,'10-10-2001')

	select * from OrdersDB

	select * from OrdersDB where u_id=1 order by o_id desc

	DELETE FROM OrdersDB WHERE o_id=1

	select OrdersDB.o_date, ProductDB.productName, ProductDB.newPrice, OrdersDB.o_quantity,UserDB.userName   from OrdersDB, ProductDB, UserDB
	where OrdersDB.p_id = ProductDB.id
	and OrdersDB.u_id = UserDB.typeid
	order by OrdersDB.o_id DESC
