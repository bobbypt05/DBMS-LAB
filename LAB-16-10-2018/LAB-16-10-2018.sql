
create table customer(cid int primary key, fname varchar(20), lname varchar(20),dob date, joining_date date, city varchar(20), state varchar(20), street varchar(20), phone_no int, fax int, monthly_discount int, pack_id int);

insert into customer values (1,'Bobby', 'Patil', '1998-09-05','2016-05-20', 'Nagpur', 'Maharashtra', 'Hudkeshwar', 1972196597, 12345678, 200, 1 );
insert into customer values (2,'Mukul', 'Lambat', '1998-04-14','2017-05-20', 'Nagpur', 'Maharashtra', 'Hudkeshwar', 972196597, 22345678, 100, 100 );
insert into customer values (3,'Mayur', 'Kewate', '1998-10-24','2017-04-10', 'Nagpur', 'Maharashtra', 'Hudkeshwar', 333196597, 22333678, 150, 107 );	
insert into customer values (4,'Chetan', 'Prajapati', '1998-10-05','2017-04-15', 'Gandhinagar', 'Gujarat', 'kemcho', 111196597, 22333888, 500, 108 );
insert into customer values (5,'Mishal', 'Shah', '1998-08-23','2016-04-15', 'Vadodara', 'Gujarat', 'Majama', 112396597, 22333456, NULL, NULL );
insert into customer values (6,'Blake', 'Truce', '1998-11-13','2016-04-15', 'Vadodara', 'Gujarat', 'Majama', 112396597, 22333456, 0, 1 );
insert into customer values (7,'Smith', 'Wade', '1998-12-07','2016-04-15', 'Vadodara', 'Gujarat', 'Majama', 112396597, 22333456, 0, 108 );
insert into customer values (102,'Sushant', 'Dhoke', '1999-04-14','2016-05-20', 'Nagpur', 'Maharashtra', 'Hudkeshwar', 972123597, 22123378, 200, 100 );

+-----+---------+-----------+------------+--------------+-------------+-------------+------------+------------+----------+------------------+---------+
| cid | fname   | lname     | dob        | joining_date | city        | state       | street     | phone_no   | fax      | monthly_discount | pack_id |
+-----+---------+-----------+------------+--------------+-------------+-------------+------------+------------+----------+------------------+---------+
|   1 | Bobby   | Patil     | 1998-09-05 | 2016-05-20   | Nagpur      | Maharashtra | Hudkeshwar | 1972196597 | 12345678 |              200 |       1 |
|   2 | Mukul   | Lambat    | 1998-04-14 | 2017-05-20   | Nagpur      | Maharashtra | Hudkeshwar |  972196597 | 22345678 |              100 |     100 |
|   3 | Mayur   | Kewate    | 1998-10-24 | 2017-04-10   | Nagpur      | Maharashtra | Hudkeshwar |  333196597 | 22333678 |              150 |     107 |
|   4 | Chetan  | Prajapati | 1998-10-05 | 2017-04-15   | Gandhinagar | Gujarat     | kemcho     |  111196597 | 22333888 |              500 |     108 |
|   5 | Mishal  | Shah      | 1998-08-23 | 2016-04-15   | Vadodara    | Gujarat     | Majama     |  112396597 | 22333456 |             NULL |    NULL |
|   6 | Blake   | Truce     | 1998-11-13 | 2016-04-15   | Vadodara    | Gujarat     | Majama     |  112396597 | 22333456 |                0 |       1 |
|   7 | Smith   | Wade      | 1998-12-07 | 2016-04-15   | Vadodara    | Gujarat     | Majama     |  112396597 | 22333456 |                0 |     108 |
| 102 | Sushant | Dhoke     | 1999-04-14 | 2016-05-20   | Nagpur      | Maharashtra | Hudkeshwar |  972123597 | 22123378 |              200 |     100 |
+-----+---------+-----------+------------+--------------+-------------+-------------+------------+------------+----------+------------------+---------+
	

create table packages( pack_id int primary key, speed int, start_date date, monthly_payment int, sid int, grade_id int(10));

insert into packages values (1,10000,'2016-01-01', 1500, 1, 1);
insert into packages values (7,30000,'2017-01-01', 1500, NULL,1);
insert into packages values (100,20000,'2016-02-01', 2000, 2, 2);
insert into packages values (107,30000,'2016-03-01', 3000, 3, 1);
insert into packages values (108,40000,'2017-03-01', 4000, 4, 2);	

+---------+-------+------------+-----------------+------+----------+
| pack_id | speed | start_date | monthly_payment | sid  | grade_id |
+---------+-------+------------+-----------------+------+----------+
|       1 | 10000 | 2016-01-01 |            1500 |    1 |        1 |
|       7 | 30000 | 2017-01-01 |            1500 | NULL |        1 |
|     100 | 20000 | 2016-02-01 |            2000 |    2 |        2 |
|     107 | 30000 | 2016-03-01 |            3000 |    3 |        1 |
|     108 | 40000 | 2017-03-01 |            4000 |    4 |        2 |
+---------+-------+------------+-----------------+------+----------+


create table sector( sid int primary key, s_name varchar(20));

insert into sector values (1, 'Private');
insert into sector values (2, 'Business');
insert into sector values (3, 'Business');
insert into sector values (4, 'Private');

+-----+----------+
| sid | s_name   |
+-----+----------+
|   1 | Private  |
|   2 | Business |
|   3 | Business |
|   4 | Private  |
+-----+----------+

create table pack_grades( grade_id int primary key, gname varchar(20), min_price int, max_parice int);

insert into pack_grades values (1,'Good', 1000,5000);
insert into pack_grades values (2,'Medium', 1200,5000);

+----------+--------+-----------+------------+
| grade_id | gname  | min_price | max_parice |
+----------+--------+-----------+------------+
|        1 | Good   |      1000 |       5000 |
|        2 | Medium |      1200 |       5000 |
+----------+--------+-----------+------------+

select customer.fname, customer.lname, customer.pack_id, packages.speed from customer, packages where customer.pack_id = packages.pack_id;

+---------+-----------+---------+-------+
| fname   | lname     | pack_id | speed |
+---------+-----------+---------+-------+
| Bobby   | Patil     |       1 | 10000 |
| Mukul   | Lambat    |     100 | 20000 |
| Mayur   | Kewate    |     107 | 30000 |
| Chetan  | Prajapati |     108 | 40000 |
| Blake   | Truce     |       1 | 10000 |
| Smith   | Wade      |     108 | 40000 |
| Sushant | Dhoke     |     100 | 20000 |
+---------+-----------+---------+-------+

select customer.fname, customer.lname, customer.pack_id, packages.speed from customer, packages where customer.pack_id = packages.pack_id and (customer.pack_id = 100 or customer.pack_id = 107) order by lname ;

+---------+--------+---------+-------+
| fname   | lname  | pack_id | speed |
+---------+--------+---------+-------+
| Sushant | Dhoke  |     100 | 20000 |
| Mayur   | Kewate |     107 | 30000 |
| Mukul   | Lambat |     100 | 20000 |
+---------+--------+---------+-------+

select packages.pack_id, packages.speed, packages.monthly_payment, sector.s_name from packages, sector where packages.sid = sector.sid; 

+---------+-------+-----------------+----------+
| pack_id | speed | monthly_payment | s_name   |
+---------+-------+-----------------+----------+
|       1 | 10000 |            1500 | Private  |
|     100 | 20000 |            2000 | Business |
|     107 | 30000 |            3000 | Business |
|     108 | 40000 |            4000 | Private  |
+---------+-------+-----------------+----------+

select customer.fname, customer.lname, customer.pack_id, packages.speed, packages.monthly_payment, sector.s_name from customer, packages, sector where customer.pack_id = packages.pack_id and packages.sid = sector.sid;

+---------+-----------+---------+-------+-----------------+----------+
| fname   | lname     | pack_id | speed | monthly_payment | s_name   |
+---------+-----------+---------+-------+-----------------+----------+
| Bobby   | Patil     |       1 | 10000 |            1500 | Private  |
| Blake   | Truce     |       1 | 10000 |            1500 | Private  |
| Mukul   | Lambat    |     100 | 20000 |            2000 | Business |
| Sushant | Dhoke     |     100 | 20000 |            2000 | Business |
| Mayur   | Kewate    |     107 | 30000 |            3000 | Business |
| Chetan  | Prajapati |     108 | 40000 |            4000 | Private  |
| Smith   | Wade      |     108 | 40000 |            4000 | Private  |
+---------+-----------+---------+-------+-----------------+----------+

select customer.fname, customer.lname, customer.pack_id, packages.speed, packages.monthly_payment, sector.s_name from customer, packages, sector where customer.pack_id = packages.pack_id and packages.sid = sector.sid and sector.s_name = 'Business';

+---------+--------+---------+-------+-----------------+----------+
| fname   | lname  | pack_id | speed | monthly_payment | s_name   |
+---------+--------+---------+-------+-----------------+----------+
| Mukul   | Lambat |     100 | 20000 |            2000 | Business |
| Mayur   | Kewate |     107 | 30000 |            3000 | Business |
| Sushant | Dhoke  |     100 | 20000 |            2000 | Business |
+---------+--------+---------+-------+-----------------+----------+

select  customer.fname, customer.lname, customer.joining_date, customer.pack_id, packages.speed, sector.s_name from customer, packages, sector where customer.pack_id = packages.pack_id and packages.sid = sector.sid and sector.s_name = 'Private' and joining_date like '2017%';

+--------+-----------+--------------+---------+-------+---------+
| fname  | lname     | joining_date | pack_id | speed | s_name  |
+--------+-----------+--------------+---------+-------+---------+
| Chetan | Prajapati | 2017-04-15   |     108 | 40000 | Private |
+--------+-----------+--------------+---------+-------+---------+

select packages.pack_id, packages.speed, packages.monthly_payment, pack_grades.gname from packages, pack_grades where pack_grades.grade_id = packages.grade_id;

+---------+-------+-----------------+--------+
| pack_id | speed | monthly_payment | gname  |
+---------+-------+-----------------+--------+
|       1 | 10000 |            1500 | Good   |
|       7 | 30000 |            1500 | Good   |
|     100 | 20000 |            2000 | Medium |
|     107 | 30000 |            3000 | Good   |
|     108 | 40000 |            4000 | Medium |
+---------+-------+-----------------+--------+

select customer.fname, customer.lname, packages.speed, packages.monthly_payment from customer inner join packages on customer.pack_id = packages.pack_id;

+---------+-----------+-------+-----------------+
| fname   | lname     | speed | monthly_payment |
+---------+-----------+-------+-----------------+
| Bobby   | Patil     | 10000 |            1500 |
| Mukul   | Lambat    | 20000 |            2000 |
| Mayur   | Kewate    | 30000 |            3000 |
| Chetan  | Prajapati | 40000 |            4000 |
| Blake   | Truce     | 10000 |            1500 |
| Smith   | Wade      | 40000 |            4000 |
| Sushant | Dhoke     | 20000 |            2000 |
+---------+-----------+-------+-----------------+

select customer.fname, customer.lname, packages.speed, packages.monthly_payment from customer left outer join packages on customer.pack_id = packages.pack_id;

+---------+-----------+-------+-----------------+
| fname   | lname     | speed | monthly_payment |
+---------+-----------+-------+-----------------+
| Bobby   | Patil     | 10000 |            1500 |
| Blake   | Truce     | 10000 |            1500 |
| Mukul   | Lambat    | 20000 |            2000 |
| Sushant | Dhoke     | 20000 |            2000 |
| Mayur   | Kewate    | 30000 |            3000 |
| Chetan  | Prajapati | 40000 |            4000 |
| Smith   | Wade      | 40000 |            4000 |
| Mishal  | Shah      |  NULL |            NULL |
+---------+-----------+-------+-----------------+

select fname, lname, speed, monthly_payment from customer right outer join packages on customer.pack_id = packages.pack_id;

+---------+-----------+-------+-----------------+
| fname   | lname     | speed | monthly_payment |
+---------+-----------+-------+-----------------+
| Bobby   | Patil     | 10000 |            1500 |
| Mukul   | Lambat    | 20000 |            2000 |
| Mayur   | Kewate    | 30000 |            3000 |
| Chetan  | Prajapati | 40000 |            4000 |
| Blake   | Truce     | 10000 |            1500 |
| Smith   | Wade      | 40000 |            4000 |
| Sushant | Dhoke     | 20000 |            2000 |
| NULL    | NULL      | 30000 |            1500 |
+---------+-----------+-------+-----------------+

select fname, lname, speed, monthly_payment from customer left outer join packages on customer.pack_id = packages.pack_id
union
select fname, lname, speed, monthly_payment from customer right outer join packages on customer.pack_id = packages.pack_id;

+---------+-----------+-------+-----------------+
| fname   | lname     | speed | monthly_payment |
+---------+-----------+-------+-----------------+
| Bobby   | Patil     | 10000 |            1500 |
| Blake   | Truce     | 10000 |            1500 |
| Mukul   | Lambat    | 20000 |            2000 |
| Sushant | Dhoke     | 20000 |            2000 |
| Mayur   | Kewate    | 30000 |            3000 |
| Chetan  | Prajapati | 40000 |            4000 |
| Smith   | Wade      | 40000 |            4000 |
| Mishal  | Shah      |  NULL |            NULL |
| NULL    | NULL      | 30000 |            1500 |
+---------+-----------+-------+-----------------+

select b.fname, b.lname, b.pack_id from customer a, customer b where (a.fname = 'Smith' or a.fname = 'Blake') and a.pack_id = b.pack_id and a.cid != b.cid; 

+--------+-----------+---------+
| fname  | lname     | pack_id |
+--------+-----------+---------+
| Bobby  | Patil     |       1 |
| Chetan | Prajapati |     108 |
+--------+-----------+---------+

select a.fname, a.lname, a.monthly_discount from customer a, customer b where b.cid = 102 and a.monthly_discount < b.monthly_discount and a.pack_id is not NULL;

+-------+--------+------------------+
| fname | lname  | monthly_discount |
+-------+--------+------------------+
| Mukul | Lambat |              100 |
| Mayur | Kewate |              150 |
| Blake | Truce  |                0 |
| Smith | Wade   |                0 |
+-------+--------+------------------+

select a.pack_id, a.speed from  packages a, packages b where b.pack_id = 7 and b.speed = a.speed and b.pack_id != a.pack_id;

+---------+-------+
| pack_id | speed |
+---------+-------+
|     107 | 30000 |
+---------+-------+

-----------------------------------------------------------------------------------Q2---------------------------------------------------------------------------------------------------

create table actor (act_id int primary key, act_name varchar(20), act_gender varchar(10));

insert into actor values (1,'salman', 'male');
insert into actor values (2,'Disha', 'female' );
insert into actor values (3,'Roy', 'male' );
insert into actor values (4,'Himanshu', 'male');
insert into actor values (5,'Mithila', 'female');
insert into actor values (6,'Hardik', 'male');

+--------+----------+------------+
| act_id | act_name | act_gender |
+--------+----------+------------+
|      1 | salman   | male       |
|      2 | Disha    | female     |
|      3 | Roy      | male       |
|      4 | Himanshu | male       |
|      5 | Mithila  | female     |
|      6 | Hardik   | male       |
+--------+----------+------------+


create table director (dir_id int primary key, dir_name varchar(20), dri_phone int(10));

insert into director values (1,'Michael',1234567890);
insert into director values (2,'Robert',1222267890);
insert into director values (3,'Stephen', 1231231234);	

+--------+----------+------------+
| dir_id | dir_name | dri_phone  |
+--------+----------+------------+
|      1 | Michael  | 1234567890 |
|      2 | Robert   | 1222267890 |
|      3 | Stephen  | 1231231234 |
+--------+----------+------------+

create table movies (mov_id int primary key, mov_title varchar(20), mov_year int(4), mov_language varchar(10), dir_id int, foreign key(dir_id) references director(dir_id));

insert into movies values (1,'xyz', 2016, 'Hindi',1);
insert into movies values (2,'abc', 2014, 'Hindi',2);
insert into movies values (3,'Yaad', 2009,'Hindi',3);
insert into movies values (4,'Yaad-2', 2018,'Hindi',3);

+--------+-----------+----------+--------------+--------+
| mov_id | mov_title | mov_year | mov_language | dir_id |
+--------+-----------+----------+--------------+--------+
|      1 | xyz       |     2016 | Hindi        |      1 |
|      2 | abc       |     2014 | Hindi        |      2 |
|      3 | Yaad      |     2009 | Hindi        |      3 |
|      4 | Yaad-2    |     2018 | Hindi        |      3 |
+--------+-----------+----------+--------------+--------+

create table movie_cast (act_id int, mov_id int, role varchar(20), foreign key(act_id) references actor(act_id), foreign key(mov_id) references movies(mov_id));

insert into movie_cast values (1,1,'Hero');
insert into movie_cast values(2,1,'Heroine');
insert into movie_cast values(3,2,'Hero');
insert into movie_cast values(2,2,'Heroine');
insert into movie_cast values(3,1,'villain');
insert into movie_cast values(4,3,'Hero');
insert into movie_cast values(5,3,'Heroine');
insert into movie_cast values(4,4,'Hero');
insert into movie_cast values(5,4,'Heroine');
insert into movie_cast values(1,4,'The Innocents');
insert into movie_cast values(4,1,'The Innocents');

+--------+--------+---------------+
| act_id | mov_id | role          |
+--------+--------+---------------+
|      1 |      1 | Hero          |
|      2 |      1 | Heroine       |
|      3 |      2 | Hero          |
|      2 |      2 | Heroine       |
|      3 |      1 | villain       |
|      4 |      3 | Hero          |
|      5 |      3 | Heroine       |
|      4 |      4 | Hero          |
|      5 |      4 | Heroine       |
|      1 |      4 | The Innocents |
|      4 |      1 | The Innocents |
+--------+--------+---------------+


create table rating (mov_id int, rev_stars int, reviewer varchar(10), foreign key(mov_id) references movies(mov_id));

insert into rating values (1, 4, 'Hardik');
insert into rating values (1, 3, 'Chetan');
insert into rating values (1, 2, 'Prince');
insert into rating values (2, 5, 'Hardik');
insert into rating values (2, 4, 'Chetan');	
insert into rating values (3, 3, 'Hardik');
insert into rating values (4, 5, 'Hardik');
insert into rating values (4, 4, 'Chetan');

+--------+-----------+----------+
| mov_id | rev_stars | reviewer |
+--------+-----------+----------+
|      1 |         4 | Hardik   |
|      1 |         3 | Chetan   |
|      1 |         2 | Prince   |
|      2 |         5 | Hardik   |
|      2 |         4 | Chetan   |
|      3 |         4 | Hardik   |
|      4 |         4 | Hardik   |
|      4 |         4 | Chetan   |
+--------+-----------+----------+

select mov_title from movies, director where movies.dir_id = director.dir_id and director.dir_name = "Michael";

+-----------+
| mov_title |
+-----------+
| xyz       |
+-----------+

select  distinct movies.mov_title from movie_cast, movies, (select act_id, count(act_id) as movie_count from movie_cast group by (act_id) ) as tbl where movie_cast.mov_id = movies.mov_id and movie_cast.act_id = tbl.act_id and movie_count > 1;

+-----------+
| mov_title |
+-----------+
| xyz       |
| abc       |
| Yaad      |
| Yaad-2    |
+-----------+

select distinct act_name from actor, movies, movie_cast where actor.act_id = movie_cast.act_id and movie_cast.mov_id = movies.mov_id and (movies.mov_year < 2010 or movies.mov_year > 2017);

+----------+
| act_name |
+----------+
| Himanshu |
| Mithila  |
| salman   |
+----------+

select movies.mov_title, tbl.max_rating from movies, (select mov_id, max(rev_stars) as max_rating from rating group by mov_id) as tbl where movies.mov_id = tbl.mov_id order by movies.mov_title;

+-----------+------------+
| mov_title | max_rating |
+-----------+------------+
| abc       |          5 |
| xyz       |          4 |
| Yaad      |          4 |
| Yaad-2    |          4 |
+-----------+------------+

update rating, movies, director set rating.rev_stars = 4 where rating.mov_id = movies.mov_id and movies.dir_id = director.dir_id and dir_name = 'Stephen';

Query OK :P

select director.dir_name from director, movies, movie_cast where director.dir_id = movies.dir_id and movies.mov_id = movie_cast.mov_id and movie_cast.role = 'The Innocents'; 

+----------+
| dir_name |
+----------+
| Stephen  |
| Michael  |
+----------+

select movies.mov_title from movies, rating where movies.mov_id = rating.mov_id and rating.rev_stars = 0;

Empty set (0.00 sec)

select tbl.reviewer , movies.mov_title from movies, rating, (select reviewer, count(reviewer) as countx from rating group by reviewer) as tbl where movies.mov_id = rating.mov_id and rating.reviewer = tbl.reviewer and tbl.countx > 1;

+----------+-----------+
| reviewer | mov_title |
+----------+-----------+
| Hardik   | xyz       |
| Chetan   | xyz       |
| Hardik   | abc       |
| Chetan   | abc       |
| Hardik   | Yaad      |
| Hardik   | Yaad-2    |
| Chetan   | Yaad-2    |
+----------+-----------+

