

/* create a patient table with pat_id as primary key*/
CREATE TABLE patient
(
p_name VARCHAR(20),/*patient name*/
p_address VARCHAR(255),/*patient address*/
admitted_date VARCHAR(20),
checkout_date VARCHAR(20),
ward_no INT NOT NULL UNIQUE KEY,
bed_no INT NOT NULL ,
room_no INT NOT NULL UNIQUE KEY,
pat_id INT NOT NULL,
doc_id INT NOT NULL UNIQUE KEY,
PRIMARY KEY(pat_id)

);

CREATE TABLE admitted_in
(
ward_no INT NOT NULL,
pat_id INT NOT NULL,
 FOREIGN KEY(pat_id) REFERENCES patient(pat_id),
 foreign key(ward_no) references ward(ward_no)
 );

/*create a ward table with ward_no as primary key*/
CREATE TABLE ward
(
ward_no INT NOT NULL,
w_name VARCHAR(20),/*ward name*/
capacity INT NOT NULL,/*ward capacity*/
PRIMARY KEY(ward_no)
);

CREATE TABLE duty_in
(
doc_id INT NOT NULL,
ward_no INT NOT NULL,
FOREIGN KEY(doc_id) REFERENCES doctor(doc_id),
FOREIGN KEY(ward_no) REFERENCES ward(ward_no)
);
/* create a test table with test_id as primary key and pat_id as foreign key*/
CREATE TABLE test
(
date VARCHAR(10),/*test date*/
time VARCHAR(10),/* test time*/
result VARCHAR(40),/*test result*/
name VARCHAR(20),/*test name*/
test_id INT NOt null,
PRIMARY KEY(test_id)
);

CREATE TABLE test_log
(
pat_id INT NOT NULL,
test_id INT NOT NULL,
FOREIGN KEY(pat_id) REFERENCES patient(pat_id),
FOREIGN KEY (test_id) REFERENCES test(test_id)
);
/*  create a table doctor with doc_id as primary key*/
CREATE TABLE doctor
(
name CHAR(20),/*doctor name*/
fee VARCHAR(20),/*doctor fee*/
specialization CHAR(20),/* doctor specialization*/
doc_id INT NOT NULL,
PRIMARY KEY(doc_id)
);

CREATE TABLE performed_by
(
test_id INT NOT NULL,
doc_id INT NOT NULL,
FOREIGN KEY(test_id) REFERENCES doctor(doc_id),
FOREIGN KEY(doc_id) REFERENCES test(test_id)
);

/*populating values into patient table*/
INSERT INTO patient VALUES('ramya','2707 pleasantdale rd apt202','2016-02-08','2016-02-10','1','2','3','11','24');

INSERT INTO patient VALUES('ramesh','2708 pleasantdale rd apt206','2016-02-09','2016-02-11','2','3','4','22','34');

INSERT INTO patient VALUES('raghu','2709 pleasantdale rd apt205','2016-02-11','2016-02-12','3','4','5','33','56');

INSERT INTO patient VALUES('ratna','2706 pleasantdale rd apt204','2016-02-12','2016-02-13','4','5','6','44','35');

INSERT INTO patient VALUES('rama','2704 pleasantdale rd apt203','2016-02-13','2016-02-14','5','6','7','55','64');

INSERT INTO patient VALUES('rakesh','2703 pleasantdale rd apt201','2016-02-14','2016-02-16','6','7','8','66','78');

/*populating values into ward table*/
INSERT INTO ward VALUES('123','baby','40');

INSERT INTO ward VALUES('234','general','40');

INSERT INTO ward VALUES('134','emergency','40');

INSERT INTO ward VALUES('345','handicapped','40');

INSERT INTO ward VALUES('125','male','40');

INSERT INTO ward VALUES('122','female','40');

/*populating values into test table*/

INSERT INTO test VALUES('2016-03-16','03:40PM','NORMAL','WBC','1234543');

INSERT INTO test VALUES('2016-03-17','11:40AM','POSITIVE','BLOOD TEST','34456');

INSERT INTO test VALUES('2016-03-18','12:42PM','NEGATIVE','HIV','345435');

INSERT INTO test VALUES('2016-03-19','03:30AM','NORMAL','WBC','444363');

INSERT INTO test VALUES('2016-03-20','01:45PM','CRITICAL','WBC','553466');

INSERT INTO test VALUES('2016-03-11','02:43PM','NEED SURGERY','WBC','6654656');

/*populating values into doctor table*/

INSERT INTO doctor VALUES('prasad','$25','skin','90');

INSERT INTO doctor VALUES('prakash','$30','heart','91');

INSERT INTO doctor VALUES('pervez','$40','children','92');

INSERT INTO doctor VALUES('swetha','$20','gynacolegist','93');

INSERT INTO doctor VALUES('pranaya','$50','M.D','94');

INSERT INTO doctor VALUES('pratheek','$45','nephrologist','95');

INSERT INTO admitted_in VALUES('123','11');
INSERT INTO admitted_in VALUES('234','22');
INSERT INTO admitted_in VALUES('134','33');
INSERT INTO admitted_in VALUES('345','44');
INSERT INTO admitted_in VALUES('125','55');
INSERT INTO admitted_in VALUES('122','66');

insert into test_log values('11','1234543');
insert into test_log values('22','34456');
insert into test_log values('33','345435');
insert into test_log values('44','444363');
insert into test_log values('55','553466');
insert into test_log values('66','6654656');

insert into duty_in values('90','123');
insert into duty_in values('91','234');
insert into duty_in values('92','134');
insert into duty_in values('93','345');
insert into duty_in values('94','125');
insert into duty_in values('95','122');

insert into performed_by values('1234543','90');
insert into performed_by values('34456','91');
insert into performed_by values('345435','92');
insert into performed_by values('444363','93');
insert into performed_by values('553466','94');
insert into performed_by values('6654656','95');


/*selecting required data from the database*/

SELECT * FROM patient WHERE pat_id='11'; /*getting patient details for the given patient id*/

SELECT*FROM
patient INNER JOIN test_log 
ON patient.pat_id=test_log.pat_id
WHERE p_name='ramya';
/*getting all the details of patient for the given patient name*/

SELECT * FROM patient WHERE p_name LIKE 'ram%';/* getting patient details for the name starting with ram*/

SELECT name,MAX(fee) FROM doctor GROUP BY name ;

SELECT * FROM patient ORDER BY p_name;/*order by is used to sort the records*/

SELECT * FROM Patient WHERE admitted_date between '2016-02-08' and '2016-02-12';/*getting all the patient details within the range*/

select max(fee),min(fee) from doctor;/*getting the max and min fee of the doctor*/



select  pat_id, p_name,test.name
 from patient
 inner join test
 where pat_id between '22' and'33';/*getting pat_id,pat_name,and test name for the patients within the range*/


select pat_id,p_name,ward_no,doctor.name
from patient
inner join doctor
order by pat_id;/*getting details of patient and doctor who is checking */
