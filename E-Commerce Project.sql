/* table employee*/
CREATE TABLE employee
(
emp_id INT NOT NULL,/*employee id acts as a primary coloumn*/
last_name VARCHAR(20),
frist_name VARCHAR(20),
title VARCHAR(20),
birth_date VARCHAR(20),
hire_date VARCHAR(20),
address VARCHAR(20),
city VARCHAR(20),
region CHAR(20),
postalcode INT,
country CHAR(34),
home_phone INT,
extension INT,
photo CHAR(22),
notes CHAR(12),
reports_to INT,
PRIMARY KEY(emp_id)
);

/*table customer*/
CREATE TABLE customer
(
cust_id INT NOT NULL,/*customer id acts as a primary coloumn*/
company VARCHAR(30) UNIQUE KEY,
contact VARCHAR(30) UNIQUE KEY,
title VARCHAR(20),
address VARCHAR(30),
city CHAR(20),
region VARCHAR(20),
postalcode INT UNIQUE KEY,
country VARCHAR(20) UNIQUE KEY,
phone INT,
fax INT,
maxodramt int,
PRIMARY KEY(cust_id)
);

/*table products*/
CREATE TABLE products
(
product_id INT NOT NULL,/*product id acts as a primary coloumn*/
product_name VARCHAR(20),
eng_name CHAR(20),
no_in_unit VARCHAR(20),
unit_price DECIMAL,
unit_cost DECIMAL,
in_stock INT,
on_order INT,
reorder_at INT,
discontinu INT,
PRIMARY KEY(product_id)
);

/*table ordered items */
CREATE TABLE orditems
(
line_no INT,
order_id INT NOT NULL,/*acts as a primary coloumn*/
product_id INT NOT NULL,
unit_price DECIMAL,
quantity DECIMAL,
PRIMARY KEY(order_id),
FOREIGN KEY(product_id) REFERENCES products(product_id)
);

/*table orders*/

CREATE TABLE orders
(
order_id INT NOT NULL,/*order id acts as primary coloumn*/
cust_id INT NOT NULL,
emp_id INT NOT NULL,
to_name CHAR(25),
to_address VARCHAR(45),
to_city VARCHAR(23),
to_region VARCHAR(23),
postalcode INT,
to_country CHAR(23),
ship_count CHAR(23),
ship_via INT,
order_date VARCHAR(20), 
order_amt DECIMAL,
order_dsc VARCHAR(23),
order_net DECIMAL,
require_by  VARCHAR(23),
shipped_on VARCHAR(20),
freight VARCHAR(20),
PRIMARY KEY(order_id),
FOREIGN KEY(cust_id) REFERENCES customer(cust_id),
FOREIGN KEY(emp_id) REFERENCES employee(emp_id)
);


drop table orders;
drop table orditems;
drop  table employee;
drop table customer;
drop table products;


select*from employee;
