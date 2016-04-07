/* table branch */
CREATE TABLE branch
(
branch_id INT NOT NULL, /* acts as a primary coloumn */
branch_name VARCHAR(20),
branch_address VARCHAR(127),
PRIMARY KEY (branch_id)
);

/* table account */
CREATE TABLE account
(
account_no INT NOT NULL, /* acts as a primary coloumn */
account_name VARCHAR(25),
balance DECIMAL(10,2),
branch_id INT,
PRIMARY KEY (account_no), 
FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);

/* table client */
CREATE TABLE client
(
account_no INT NOT NULL, /* acts as a primary coloumn */
name_n VARCHAR(20),
age INT NOT NULL,
address VARCHAR(127),
PRIMARY KEY (account_no),
FOREIGN KEY (account_no) REFERENCES account(account_no)
);

/* table transaction */
CREATE TABLE transaction
(
transaction_id INT NOT NULL, /* acts as a primary coloumn */
amount DECIMAL(10,2),
tdate VARCHAR(20), /* transaction date */
ttype VARCHAR(20), /* transaction type */
account_no INT NOT NULL,
PRIMARY KEY (transaction_id),
FOREIGN KEY (account_no) REFERENCES account(account_no)
);

/* drop is used to delete a table */

DROP TABLE transaction;
DROP TABLE client;
DROP TABLE account;
DROP TABLE branch;

/* populating values into the table */

INSERT INTO branch VALUES('1','Tysons1','2707 pleasantadale road apt 202');
INSERT INTO branch VALUES('2','herndon','2706 prescott road apt 208');

INSERT INTO account VALUES('11','xxxx','15000.00','1');
INSERT INTO account VALUES('12','yyyy','16000.00','2');

INSERT INTO client VALUES('11','ramya','25','42567 stratford landing drive');
INSERT INTO client VALUES ('12','ramesh','26','43587 livingstone plaza');

INSERT INTO transaction VALUES('123','45000.00','04-22-93','HOME_LOAN','11');
INSERT INTO transaction VALUES('127','55000.00','09-28-97','CAR_LOAN','12');

/* selecting required data from the database */


SELECT * FROM account WHERE branch_id='2'; /* getting account details for the given branch id */

SELECT * FROM client WHERE account_no='12'; /* getting client details for the given account no */

SELECT * FROM transaction WHERE account_no='11'; /* getting transaction details for the given account no */

 SELECT * FROM account WHERE account_name='xxxx';/* getting account details for the given account name*/

SELECT * FROM account WHERE account_name LIKE 'RAM%';/* getting account details for the name starting with RAM */

SELECT MAX(balance) FROM account WHERE account_no='11';/* getting max balance for the given acount no*/


SELECT account_no,account_name,balance,account.branch_id,branch_name,branch_address
FROM 
account INNER JOIN branch
ON account.branch_id=branch.branch_id
WHERE account_name='xxxx'; /* getting all the bank details for the given account name */



select avg(balance) from account
where account_name='xxxx';/*find the average balance for the given account name*/

select account_no,balance from account
where balance<15500.0;/* find bank account with balance <15500.0*/








