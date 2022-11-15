drop database join_demo;
create database join_demo;
use join_demo;

create table Restaurant(
rID int primary key,
Name varchar(25)
);
-- Ques. 1 Insert values into the restaurant table;
insert into restaurant values
(1, "Punjabi Rasoi"),
(2, "Udupi Grand"),
(3, "BBQ nation");


-- Ques. 2 Insert values into the dishes tables;
create table dishes(
dID int,
dishName varchar(45),
price float,
rID int,
foreign key(rID) references  Restaurant(rID)
);


insert into dishes values
(1, "Dal Makhni", 120, 1),
(2, "Sarso Saag", 100, 1),
(3, "Tandoori Roti", 12, 1),
(4, "Masala Dosa", 40, 2),
(5, "Rava Idly", 50, 2),
(6, "Vada", 30, 2),
(7, "Pizza", 150, 3),
(8, "Burger", 80, 3),
(9, "Momos", 50, 3);


-- Ques. 3 Perform left join, right join, inner join;
select dishes.dishname, dishes.price, Restaurant.name from Restaurant inner join dishes on Restaurant.rID = dishes.rid;

select dishes.dishname, dishes.price, Restaurant.name from Restaurant left join dishes on Restaurant.rID = dishes.rid;

select dishes.dishname, dishes.price, Restaurant.name from Restaurant right join dishes on Restaurant.rID = dishes.rid;

-- Ques 4. Count the no of dishes with unique prices;
select count(distinct(price)) from dishes;

-- Ques 5. Display the restaurant name which has a dish with price less than 20;
select distinct(Restaurant.Name) from  Restaurant, dishes where Restaurant.rid = dishes.rid and price < 20; -- Restaurant, dishes is refering table name;

-- Ques 6. Display the restaurant names that have at least three dishes in their menu;
select restaurant.name from restaurant, dishes where restaurant.rid = dishes.rid group by restaurant.rid having count(restaurant.rid)>=3;

-- Increase the prices of all dishes by 10%, whose current price is less than or equal to 50.

update dishes set price = price * 1.1 where price <=50;















