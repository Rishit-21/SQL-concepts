--CREATE DATABASE book_info

--use book_info

--create table author(
--	author_id varchar(255) primary key, 
--	author_name varchar(255) 
--)

--insert into author(author_id,author_name)
--	values
--			('2','luffy'),
--			('3','Jhonas'),
--			('4','Zoro'),
--			('5','Harvey');

--select * from dbo.author



--create table publisher(
--	publisher_id varchar(255) primary key,
--	publisher_name varchar(255)
--)

--insert into publisher(publisher_id,publisher_name)
--		values 
--			('1','leaf_village_publications'),
--			('2','one_piece_publications'),
--			('3','best_publications')

--select * from publisher





--create table books(	
--	book_id varchar(255) primary key,
--	book_name varchar(255),
--	author_id varchar(255) foreign key  references author(author_id),
--	price numeric(10,2),
--	publisher_id varchar(255) foreign key references publisher(publisher_id)
--)

--insert into books(book_id,book_name,author_id,price,publisher_id)
--		values ('1','How_to_be_hokage','1',2000,'1'),
--		      ('2','My_Ninja_Way','1',2500,'1'),
--			  ('3','Friends','1',1500,'1'),
--			  ('4','In_search_of_treasure','2',2000,'2'),
--			  ('5','My_voyage','2',2500,'2'),
--			  ('6','My_crew','2',3000,'2'),
--			  ('7','Time_travel','3',1000,'3'),
--			  ('8','Finding_my_way','4',900,'3'),
--			  ('9','Suites','5',850,'3')



--select*from books




--create table credit_card_details(
--	credit_card_number varchar(255) primary key,
--	credit_card_type varchar(255),
--	expiry_date  varchar(255)
-- )

--insert into credit_card_details(credit_card_number,credit_card_type,expiry_date)
--			values(12346789,'master_card','2025-12-12'),
--				(12346710,'visa_card','2025-12-10'),
--				(12346711,'master_card','2025-11-8'),
--				(12346712,'visa','2025-11-8'),
--				(12346713,'master_card','2025-1-2'),
--				(12346714,'visa_card','2025-11-8')

--select *  from credit_card_details



--create table customer(
--	customer_id varchar(255) primary key,
--	customer_name varchar(255),
--	street_address varchar(255),
--	city varchar(255),
--	phone_number varchar(255),
--	credit_card_number varchar(255) foreign key references credit_card_details(credit_card_number)
--)

--insert into customer(customer_name,street_address,city,phone_number,credit_card_number)
--		values('Rishit_kalyani','kalawad_road,360005','rajkot','9409249071',12346789),
--		('Sahil_parsaniya','kalawad_road,360006','ahemdabad','9409249073',12346710),
--		('Hardi_govani','indira_circle,360005','rajkot','9898989898',12346711),
--		('darshan_kagathra','indira_circle,360005','surat','9988998899',12346712),
--		('Hemangi_nirmal','raiya_chowk,360006','mumbai','9112457820',12346713),
--		('shivraj_chavda','indira_circle,360005','delhi','1234567890',12346714)

--select * from customer



				

--create table shipping_type(
--	shipping_type varchar(255) primary key,
--	shipping_price numeric(10,2)

--)

--insert into shipping_type(shipping_type,shipping_price)
--		values('fedEx',100),
--				('LTL',80),
--				('UPS',110)

--select * from shipping_type

--create table shopping_cart(
--	shopping_cart_id numeric(10,0) primary key,
--	book_id varchar(255) foreign key references books(book_id),
--	price numeric(10,2),
--	date datetime2,
--	quantity numeric(10,0)

--)

--insert into shopping_cart(book_id,price,date,quantity)
--		values(1,2000,'2022-07-07 00:00:00',3),
--				(2,2500,'2022-06-11 00:00:00',2),
--				(1,2000,'2022-07-15 00:00:00',3),
--				(4,2000,'2022-07-07 00:00:00',1),
--				(5,2500,'2021-09-21 00:00:00',4),
--				(6,2000,'2021-07-29 00:00:00',3)

--select * from shopping_cart



--create table order_details(
--	order_id numeric(10) primary key,
--	customer_id varchar(255) foreign key references customer(customer_id),
--	Shipping_type varchar(255) foreign key references shipping_type(shipping_type),
--	date_of_purchase datetime2,
--	shopping_cart_id numeric(10,0) foreign key references shopping_cart(shopping_cart_id)
--)

--insert into order_details(customer_id,shipping_type,date_of_purchase,shopping_cart_id)
--		values(1,'fedEx','2022-12-01',5),
--				(2,'fedEx','2022-11-12',3),
--				(3,'LTL','2022-01-11',4),
--				(1,'UPS','2022-01-26',5),
--				(3,'LTL','2022-01-26',6),
--				(4,'fedEx','2022-12-01',3),
--				(6,'UPS','2022-12-16',2),
--				(6,'fedEx','2022-09-01',1),
--				(5,'UPS','2022-08-01',1),
--				(5,'LTL','2022-10-01',3)

--select * from order_details





--create table purchaser_history(
--	customer_id varchar(255) foreign key references customer(customer_id),
--	order_id numeric(10,0) foreign key references order_details(order_id)
--)

--insert into purchaser_history(customer_id,order_id)
--			values(1,1),
--				(2,2),
--				(3,3),
--				(1,4),
--				(3,5),
--				(4,6),
--				(6,7),
--				(6,8),
--				(5,9),
--				(5,10)
--select * from purchaser_history

--BACKUP DATABASE book_info
--TO DISK = 'D:\books_backUp1.bak';

--create view  customer_order_details as 
--	select customer_name,concat(street_address,city) as customer_address ,shipping_type,date_of_purchase,book_name,shopping_cart.price,quantity 
--		from customer inner join order_details on customer.customer_id=order_details.customer_id 
--			inner join shopping_cart on order_details.shopping_cart_id = shopping_cart.shopping_cart_id
--				inner join books on shopping_cart.book_id=books.book_id

--select * from customer_order_details

--drop view customer_order_details

--create view customers_purchasing_history as
--	select customer_name, customer.customer_id,books.book_id,date_of_purchase,shopping_cart.shopping_cart_id 
--		from customer 
--		inner join purchaser_history on customer.customer_id=purchaser_history.customer_id 
--		inner join order_details on purchaser_history.order_id = order_details.order_id
--		inner join shopping_cart on order_details.shopping_cart_id=shopping_cart.shopping_cart_id
--		inner join books on shopping_cart.book_id = books.book_id
	



--	select * from customers_purchasing_history

--BACKUP DATABASE book_info
--TO DISK = 'D:\books_backUp.bak'
--with differential;

--select count(*) from books