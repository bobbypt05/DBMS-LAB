
####################################################### PART A ##############################################################################

create table employee( fname varchar(20), lname varchar(20), EID int, start_date date, office varchar(20), salary int, dno int, bonus int, email varchar(20), primary key(EID));

insert into employee values("John", "Taylor", 1777, "2012-04-13", "Chicago", 20000, 4, 400, "jtaylor@yahoo.com");
insert into employee values("Trevor", "Williams", 1945, "1980-06-23", "London", 55055, 4, 1000, "trev_willi@gmail.com");
insert into employee values("Zoe", "Johnson", 2050, "1992-06-23", "Paris", 55055, 5, 2000, "zoe777@msn.com");
insert into employee values("Kathy", "Franklin", 2051, "2013-06-29", "Chicago", 20000, 5, 0, "kathyfrank@gmail.com");
insert into employee values("Trevor", "Jocob", 2398, "1990-06-23", "London", 55055, 4, 0, "trevorJ235@aol.com" ); 
insert into employee values("John", "Owens", 7777, "2014-12-04", "London", 130000, 4, 3500, "mailjude@yahoo.com");
insert into employee values("Alice","Bright",8888,"1973-12-19","London",111114, 7, 3000, "ab23@gmail.com");	

+--------+----------+------+------------+---------+--------+------+-------+----------------------+
| fname  | lname    | EID  | start_date | office  | salary | dno  | bonus | email                |
+--------+----------+------+------------+---------+--------+------+-------+----------------------+
| John   | Taylor   | 1777 | 2012-04-13 | Chicago |  20000 |    4 |   400 | jtaylor@yahoo.com    |
| Trevor | Williams | 1945 | 1980-06-23 | London  |  55055 |    4 |  1000 | trev_willi@gmail.com |
| Zoe    | Johnson  | 2050 | 1992-06-23 | Paris   |  55055 |    5 |  2000 | zoe777@msn.com       |
| Kathy  | Franklin | 2051 | 2013-06-29 | Chicago |  20000 |    5 |     0 | kathyfrank@gmail.com |
| Trevor | Jocob    | 2398 | 1990-06-23 | London  |  55055 |    4 |     0 | trevorJ235@aol.com   |
| John   | Owens    | 7777 | 2014-12-04 | London  | 130000 |    4 |  3500 | mailjude@yahoo.com   |
| Alice  | Bright   | 8888 | 1973-12-19 | London  | 111114 |    7 |  3000 | ab23@gmail.com       |
+--------+----------+------+------------+---------+--------+------+-------+----------------------+


create table currency_table( location varchar(20), currency_code varchar(5), primary key(location) );

insert into currency_table values("Chicago","USD");
insert into currency_table values("London","GBP");
insert into currency_table values("Paris","EUR");

+----------+---------------+
| location | currency_code |
+----------+---------------+
| Chicago  | USD           |
| London   | GBP           |
| Paris    | EUR           |
+----------+---------------+

sselect employee.office, employee.EID, concat(employee.salary," ",currency_table.currency_code) as salary from employee inner join currency_table on employee.office = currency_table.location;

+---------+------+------------+
| office  | EID  | salary     |
+---------+------+------------+
| Chicago | 1777 | 20000 USD  |
| London  | 1945 | 55055 GBP  |
| Paris   | 2050 | 55055 EUR  |
| Chicago | 2051 | 20000 USD  |
| London  | 2398 | 55055 GBP  |
| London  | 7777 | 130000 GBP |
| London  | 8888 | 111114 GBP |
+---------+------+------------+



select a.fname, a.lname, a.EID from employee a, employee b where a.fname = b.fname and a.EID != b.EID;

+--------+----------+------+
| fname  | lname    | EID  |
+--------+----------+------+
| John   | Owens    | 7777 |
| Trevor | Jocob    | 2398 |
| Trevor | Williams | 1945 |
| John   | Taylor   | 1777 |
+--------+----------+------+

select trim(trailing ".com" from substring_index(email, '@', -1)) as mailservice, count(*) as count from employee group by trim(trailing ".com" from substring_index(email, '@', -1)) having count>1;

+-------------+-------+
| mailservice | count |
+-------------+-------+
| gmail       |     3 |
| yahoo       |     2 |
+-------------+-------+

select (0.05*salary) as 'Deduction' , (salary - 0.05*salary + bonus ) as 'Final_Salary' from employee;

+-----------+--------------+
| Deduction | Final_Salary |
+-----------+--------------+
|   1000.00 |     19400.00 |
|   2752.75 |     53302.25 |
|   2752.75 |     54302.25 |
|   1000.00 |     19000.00 |
|   2752.75 |     52302.25 |
|   6500.00 |    127000.00 |
|   5555.70 |    108558.30 |
+-----------+--------------+

select * from employee order by salary desc, lname;

+--------+----------+------+------------+---------+--------+------+-------+----------------------+
| fname  | lname    | EID  | start_date | office  | salary | dno  | bonus | email                |
+--------+----------+------+------------+---------+--------+------+-------+----------------------+
| John   | Owens    | 7777 | 2014-12-04 | London  | 130000 |    4 |  3500 | mailjude@yahoo.com   |
| Alice  | Bright   | 8888 | 1973-12-19 | London  | 111114 |    7 |  3000 | ab23@gmail.com       |
| Trevor | Jocob    | 2398 | 1990-06-23 | London  |  55055 |    4 |     0 | trevorJ235@aol.com   |
| Zoe    | Johnson  | 2050 | 1992-06-23 | Paris   |  55055 |    5 |  2000 | zoe777@msn.com       |
| Trevor | Williams | 1945 | 1980-06-23 | London  |  55055 |    4 |  1000 | trev_willi@gmail.com |
| Kathy  | Franklin | 2051 | 2013-06-29 | Chicago |  20000 |    5 |     0 | kathyfrank@gmail.com |
| John   | Taylor   | 1777 | 2012-04-13 | Chicago |  20000 |    4 |   400 | jtaylor@yahoo.com    |
+--------+----------+------+------------+---------+--------+------+-------+----------------------+


select a.dno from (select dno,count(bonus) as bonus_count from employee where bonus<>0  group by (dno))  as a where a.bonus_count >1;

+------+
| dno  |
+------+
|    4 |
+------+

####################################################### PART B ##############################################################################

select a.salary from (select Distinct salary from employeeB) as a order by salary limit 1, 1;

+--------+
| salary |
+--------+
|  55055 |
+--------+

select substring_index(email, '@', 1) as username from employee;

+------------+
| username   |
+------------+
| jtaylor    |
| trev_willi |
| zoe777     |
| kathyfrank |
| trevorJ235 |
| mailjude   |
| ab23       |
+------------+

