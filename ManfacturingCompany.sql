create table employee1
(
emp_id int not null, /* EMPLOYEE ID,ACTS AS A PRIMARY COLOUMN*/
e_name varchar(20), /* EMPLLYEE NAME */
e_age int not null, /* EMPLOYEE AGE*/
address varchar(25),
primary key(emp_id)
);
/* TABLE PROJECT */
create table project 
(
project_id int not null,/* ACTS AS A PRIMARY COLUMN */
project_name varchar(255),
p_start_date varchar(20), /*PROJECT START DATE */
p_end_date varchar(20), /* PROJECT END DATE */
emp_id int not null,
primary key (project_id),
foreign key (emp_id) references employee1(emp_id)
);



/* TABLE SUPPLY*/
create table supply
(
s_id int not null, /* SUPPLIER ID*/
s_name varchar(20),/* SUPPLIER NAME*/
s_address varchar(30),/*SUPPLIER ADDRESS*/
primary key(s_id)

);

/* TABLE WAREHOUSE */
create table warehouse
(
w_id int not null,/* WAREHOUSE ID*/
w_address varchar(25),/* WAREHOUSE ADDRESS */
w_capacity int not null,/* WAREHOUSE CAPACITY*/
primary key(w_id)
);

create table parts
(
part_id int not null,
part_name varchar(20),
project_id int not null,
primary key(part_id),
s_id int not null,
w_id int not null,
foreign key(project_id) references project(project_id),
foreign key(s_id) references supply(s_id),
foreign key(w_id) references warehouse(w_id)
);

/* POPULATING VALUES INTO A TABLE*/

insert into employee1 values('1','ramya','22','4566,oakton road');
insert into employee1 values('2','ram','28','4567,allen road');

insert into project values ('11','MICROSTRATEGY','03-24-2016','03-24-2017','1');
insert into project values ('12','RALLY','03-24-2018','03-24-2019','2');

insert into supply values ('67','aishu','3456,breckett terrace');

insert into supply values ('69','amrutha','3446,ghazwa terrace');

insert into warehouse values('123','2346 gandhipuram','45 ');
insert into warehouse values('234','2313 danvaipeta','34 ');

insert into parts values ('99','RAM','11','67','123');
insert into parts values ('100','ROM','12','69','234');

select * from project where emp_id='1';/* getting project details by the employee id */

select * from parts where s_id='67';/* getting part details for the given supplier id */



select *from employee1
inner join project
on project.emp_id=employee1.emp_id;/*getting all the details  of the employee and the project he is working on */

select * from supply
inner join parts
on supply.s_id= parts.s_id;/*getting the details like who supplied which part like part_id,part_name */

