
create table employee(employee_name varchar(20), street varchar(20) , city varchar(20));

create table works(employee_name varchar(20), company_name varchar(20), salary int );

create table company(company_name varchar(20), city varchar(20));

create table manages(employee_name varchar(20), manager_name varchar(20));

insert into employee values ('Bobby', 'Burdi Street Road', 'Nagpur');

insert into employee values ('Mukul', 'Saubhagya Road', 'Nagpur');

insert into employee values ('Himanshu', 'Saubhagya Road', 'Hyderabad');

insert into employee values ('Prince', 'Great Meera Road', 'Delhi');

insert into employee values ('Mayur', 'Saubhagya Road', 'Nagpur');

+---------------+-------------------+-----------+
| employee_name | street            | city      |
+---------------+-------------------+-----------+
| Bobby         | Burdi Street Road | Nagpur    |
| Mukul         | Saubhagya Road    | Nagpur    |
| Mayur         | Saubhagya Road    | Nagpur    |
| Himanshu      | Saubhagya Road    | Hyderabad |
| Prince        | Great Meera Road  | Delhi     |
+---------------+-------------------+-----------+

insert into works values('Bobby', 'State Bank of India', 20000);

insert into works values('Mukul', 'State Bank of India', 25000);

insert into works values('Mayur', 'State Bank of India', 5000);

insert into works values('Himanshu', 'Google', 50000);

insert into works values('Prince', 'ICICI', 10000);	

+---------------+---------------------+--------+
| employee_name | company_name        | salary |
+---------------+---------------------+--------+
| Bobby         | State Bank of India |  20000 |
| Mukul         | State Bank of India |  25000 |
| Mayur         | State Bank of India |   5000 |
| Himanshu      | Google              |  50000 |
| Prince        | ICICI               |  10000 |
+---------------+---------------------+--------+

insert into company values('Google','Hyderabad');

insert into company values('State Bank of India','Bangalore');

insert into company values('ICICI','Delhi');

insert into company values('ICICI','Mumbai');

insert into company values('Microsoft','Delhi');

insert into company values('Microsoft','Mumbai');

insert into company values('Google','Mumbai');	

+---------------------+-----------+
| company_name        | city      |
+---------------------+-----------+
| State Bank of India | Bangalore |
| Google              | Hyderabad |
| ICICI               | Delhi     |
| Microsoft           | Delhi     |
| Microsoft           | Mumbai    |
| Google              | Mumbai    |
| ICICI               | Mumbai    |
+---------------------+-----------+

insert into manages values ('Mukul', 'Mayur');

+---------------+--------------+
| employee_name | manager_name |
+---------------+--------------+
| Mukul         | Mayur        |
+---------------+--------------+

select employee.employee_name, employee.street, employee.city from employee, works where employee.employee_name =  works.employee_name and company_name = 'State Bank of India' and salary > 10000;

+---------------+-------------------+--------+
| employee_name | street            | city   |
+---------------+-------------------+--------+
| Bobby         | Burdi Street Road | Nagpur |
| Mukul         | Saubhagya Road    | Nagpur |
+---------------+-------------------+--------+

select employee.employee_name from employee, works, company where employee.employee_name = works.employee_name and works.company_name = company.company_name and employee.city = company.city;

+---------------+
| employee_name |
+---------------+
| Himanshu      |
+---------------+

select a.employee_name from employee as a, employee as b, manages as m where m.employee_name = a.employee_name and m.manager_name = b.employee_name and b.street = a.street and b.city = a.city; 

+---------------+
| employee_name |
+---------------+
| Mukul         |
+---------------+

select employee_name from works where company_name <> 'State Bank of India';

+---------------+
| employee_name |
+---------------+
| Himanshu      |
+---------------+

select employee_name from  works  having salary > max(salary) and company_name <> 'ICICI';

+---------------+
| employee_name |
+---------------+
| Bobby         |
| Mukul         |
| Himanshu      |
+---------------+

select company_name from company where city in (select city from company where company_name = 'ICICI') and company_name <> 'ICICI';

+--------------+
| company_name |
+--------------+
| Microsoft    |
+--------------+

select company_name  from company where city in (select city from company where company_name = 'ICICI') group by company_name HAVING COUNT(DISTINCT city) = (SELECT COUNT(city) FROM company where company_name = 'ICICI') and company_name !='ICICI';

+--------------+
| company_name |
+--------------+
| Microsoft    |
+--------------+

select employee_name from works,( select company_name, avg(salary) as avg_salary from works group by company_name ) as tbl  where works.company_name = tbl.company_name and works.salary > tbl.avg_salary;  

+---------------+
| employee_name |
+---------------+
| Bobby         |
| Mukul         |
+---------------+

select tbl.company_name from (select company_name, sum(salary) as payroll from works group by company_name ) as tbl order by tbl.payroll limit 1;

+--------------+
| company_name |
+--------------+
| ICICI        |
+--------------+

