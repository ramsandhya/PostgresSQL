DONT USE DOUBLE QUOTES IN PSQL- RECOMMENDED

From students.sql:
students_db=# CREATE TABLE student (
students_db(#   -- auto-incrementing ID, is unique, and is auto-incremented for each new row
students_db(#   -- when you insert it
students_db(#   -- *DO NOT* specifiy the id when you insert if you are using an auto-incrementing ID
students_db(#   -- Specifying the UNIQUE constraint because serial does not require uniqueness
students_db(# -- serial is an integer
students_db(#   id serial UNIQUE,
students_db(#   name varchar NOT NULL,
students_db(#   website varchar,
students_db(#   github_username varchar,
students_db(#   points integer DEFAULT 0 CHECK (points >= 0),
students_db(#   gender char(1),
students_db(#   cohort_start_date date NOT NULL,
students_db(#   graduated boolean DEFAULT FALSE
students_db(# );
CREATE TABLE
students_db=#
students_db=# insert into student (name, website, github_username, points, gender, cohort_start_date) values
students_db-#   ('Kyle', 'http://kyleluck.com/', 'kyleluck', 5, 'M', '2016-05-01');
INSERT 0 1
students_db=# insert into student (name, github_username, points, gender, cohort_start_date) values
students_db-#   ('Anthony', 'Athompsonjr26', 7, 'M', '2016-05-01');
INSERT 0 1
students_db=# insert into student (name, website, github_username, points, gender, cohort_start_date) values
students_db-#   ('Matt', 'http://matthewbrimmer.com/', 'mbrimmer83', 6, 'M', '2016-05-01');
INSERT 0 1
students_db=# insert into student (name, github_username, points, gender, cohort_start_date) values
students_db-#   ('Regan', 'rrgn', 8, 'M', '2016-05-01');
INSERT 0 1
students_db=# insert into student (name, github_username, points, gender, cohort_start_date) values
students_db-#   ('Tim', 'tsanders30004', 7, 'M', '2016-05-01');
INSERT 0 1
students_db=# insert into student (name, github_username, points, gender, cohort_start_date) values
students_db-#   ('Shanda', 'ShandaQ', 10, 'F', '2016-05-01');
INSERT 0 1
students_db=# insert into student (name, website, github_username, points, gender, cohort_start_date) values
students_db-#   ('Allen', 'https://www.allenhthompson.com/', 'AllenHThompson', 9, 'M', '2016-05-01');
INSERT 0 1
students_db=# insert into student (name, website, github_username, points, gender, cohort_start_date) values
students_db-#   ('Carolyn', 'http://www.carolynsdaniel.com/', 'csdaniel17', 7, 'F', '2016-05-01');
INSERT 0 1
students_db=# insert into student (name, website, github_username, points, gender, cohort_start_date) values
students_db-#   ('Sandhya', 'https://ramsandhya.herokuapp.com/', 'ramsandhya', 10, 'F', '2016-05-01');
INSERT 0 1
students_db=# select * from student;                                                           id |  name   |              website              | github_username | points | gender | cohort_start_date | graduated
----+---------+-----------------------------------+-----------------+--------+--------+-------------------+-----------
  1 | Kyle    | http://kyleluck.com/              | kyleluck        |      5 | M      | 2016-05-01        | f
  2 | Anthony |                                   | Athompsonjr26   |      7 | M      | 2016-05-01        | f
  3 | Matt    | http://matthewbrimmer.com/        | mbrimmer83      |      6 | M      | 2016-05-01        | f
  4 | Regan   |                                   | rrgn            |      8 | M      | 2016-05-01        | f
  5 | Tim     |                                   | tsanders30004   |      7 | M      | 2016-05-01        | f
  6 | Shanda  |                                   | ShandaQ         |     10 | F      | 2016-05-01        | f
  7 | Allen   | https://www.allenhthompson.com/   | AllenHThompson  |      9 | M      | 2016-05-01        | f
  8 | Carolyn | http://www.carolynsdaniel.com/    | csdaniel17      |      7 | F      | 2016-05-01        | f
  9 | Sandhya | https://ramsandhya.herokuapp.com/ | ramsandhya      |     10 | F      | 2016-05-01        | f
(9 rows)

students_db=# select * from student where website is NULL
students_db-# select * from student;
ERROR:  syntax error at or near "select"
LINE 2: select * from student;
        ^
students_db=# select * from student where website is NULL;                                                             id |  name   | website | github_username | points | gender | cohort_start_date | graduated
----+---------+---------+-----------------+--------+--------+-------------------+-----------
  2 | Anthony |         | Athompsonjr26   |      7 | M      | 2016-05-01        | f
  4 | Regan   |         | rrgn            |      8 | M      | 2016-05-01        | f
  5 | Tim     |         | tsanders30004   |      7 | M      | 2016-05-01        | f
  6 | Shanda  |         | ShandaQ         |     10 | F      | 2016-05-01        | f
(4 rows)

students_db=# select * from student where points <= 10;
 id |  name   |              website              | github_username | points | gender | cohort_start_date | graduated
----+---------+-----------------------------------+-----------------+--------+--------+-------------------+-----------
  1 | Kyle    | http://kyleluck.com/              | kyleluck        |      5 | M      | 2016-05-01        | f
  2 | Anthony |                                   | Athompsonjr26   |      7 | M      | 2016-05-01        | f
  3 | Matt    | http://matthewbrimmer.com/        | mbrimmer83      |      6 | M      | 2016-05-01        | f
  4 | Regan   |                                   | rrgn            |      8 | M      | 2016-05-01        | f
  5 | Tim     |                                   | tsanders30004   |      7 | M      | 2016-05-01        | f
  6 | Shanda  |                                   | ShandaQ         |     10 | F      | 2016-05-01        | f
  7 | Allen   | https://www.allenhthompson.com/   | AllenHThompson  |      9 | M      | 2016-05-01        | f
  8 | Carolyn | http://www.carolynsdaniel.com/    | csdaniel17      |      7 | F      | 2016-05-01        | f
  9 | Sandhya | https://ramsandhya.herokuapp.com/ | ramsandhya      |     10 | F      | 2016-05-01        | f
(9 rows)

students_db=# select * from student where points < 10;
 id |  name   |             website             | github_username | points | gender | cohort_start_date | graduated
----+---------+---------------------------------+-----------------+--------+--------+-------------------+-----------
  1 | Kyle    | http://kyleluck.com/            | kyleluck        |      5 | M      | 2016-05-01        | f
  2 | Anthony |                                 | Athompsonjr26   |      7 | M      | 2016-05-01        | f
  3 | Matt    | http://matthewbrimmer.com/      | mbrimmer83      |      6 | M      | 2016-05-01        | f
  4 | Regan   |                                 | rrgn            |      8 | M      | 2016-05-01        | f
  5 | Tim     |                                 | tsanders30004   |      7 | M      | 2016-05-01        | f
  7 | Allen   | https://www.allenhthompson.com/ | AllenHThompson  |      9 | M      | 2016-05-01        | f
  8 | Carolyn | http://www.carolynsdaniel.com/  | csdaniel17      |      7 | F      | 2016-05-01        | f
(7 rows)

students_db=# select * from student where char_length(github_username) <=9;
 id |  name  |       website        | github_username | points | gender | cohort_start_date | graduated
----+--------+----------------------+-----------------+--------+--------+-------------------+-----------
  1 | Kyle   | http://kyleluck.com/ | kyleluck        |      5 | M      | 2016-05-01        | f
  4 | Regan  |                      | rrgn            |      8 | M      | 2016-05-01        | f
  6 | Shanda |                      | ShandaQ         |     10 | F      | 2016-05-01        | f
(3 rows)


Solution from the exercises:
============================
## Create Database

Create a database, call it restaurant_db or anything you want. In your terminal:

$ psql
username=# CREATE DATABASE restaurant_db;
CREATE DATABASE
username=# \c restaurant_db
You are now connected to database "restaurant_db" as user "username".

Solution:
tastynummies=# CREATE DATABASE restaurants;
CREATE DATABASE
tastynummies=# \c restaurants;
You are now connected to database "restaurants" as user "jitendraram".

## Create Database Table

Write a database schema: create a restaurant_db.sql file, in it create a table called "restaurant". This table will contain the following information, you will use the appropriate data types to represent the info. Please use an auto-incrementing ID:
  * name
  * distance (in miles from ATV)
  * stars
  * category (type of food)
  * favorite dish
  * does takeout?
  * last time you ate there

Run your file one of two ways:

1. psql restaurant_db < restaurant_db.sql
2. copy-n-paste the "CREATE TABLE" statement into the PostgreSQL shell

If the table has been created successfully, you should see "CREATE TABLE" being printed. You can also describe the table schema in the shell using the \d command:

restaurant_db=# \d restaurant

Solution:

restaurants=# CREATE TABLE restaurant(
restaurants(#   id serial UNIQUE,
restaurants(#   name varchar NOT NULL,
restaurants(#   distance(from ATV) real,
restaurants(#   stars integer,
restaurants(#   category varchar,
restaurants(#   favorite dish varchar,
restaurants(#   does takeout boolean,
restaurants(#   last time you ate there date
restaurants(# );

## Insert Data

Insert data into this table by writing insert statements either directly in the PostgreSQL shell or putting it into a separate restaurant_data.sql file and then run the statements in that file using in the terminal:

$ psql restaurant_db < restaurant_data.sql

Solution:

CREATE TABLE
restaurants=# insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values                     ('Octane', '0.00', '****', 'Coffee_Bar', 'Crossianwich', 'Yes', '07,07,16');
INSERT 0 1
restaurants=# select * from restaurant
restaurants-# select * from restaurant;
ERROR:  syntax error at or near "select"
LINE 2: select * from restaurant;
        ^
restaurants=# select * from restaurant;
 id |  name  | distance_from_atv | stars |  category  | favorite_dish | takeout | last_time_i_visited
----+--------+-------------------+-------+------------+---------------+---------+---------------------
  1 | Octane |                 0 | ****  | Coffee_Bar | Crossianwich  | t       | 2016-07-07
(1 row)

restaurants=# insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
restaurants-#   ('NaanStop', '0.10', '*****', 'Indian', 'Chicken', 'Yes', '07,012,16');
INSERT 0 1
restaurants=# insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
restaurants-#   ('Chipotle', '312', '*****', 'Mexican', 'Burrito', 'Yes', '06,07,16');
INSERT 0 1
restaurants=# insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
restaurants-#   ('Starbucks', '0.10', '***', 'Coffeehouse', 'Latte', 'No', '07,09,16');
INSERT 0 1
restaurants=# insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
restaurants-#   ('OnTheBorder', '0.20', '*****', 'General', 'Tuna', 'Yes', '07,07,16');
INSERT 0 1
restaurants=# insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
restaurants-#   ('NewYorkPrime', '0.50', '***', 'Steakhouse', 'Crossianwich', 'No', '06,07,16');
INSERT 0 1
restaurants=#
restaurants=# select * from restaurant;                                                                                                                id |     name     | distance_from_atv | stars |  category   | favorite_dish | takeout | last_time_i_visited
----+--------------+-------------------+-------+-------------+---------------+---------+---------------------
  1 | Octane       |                 0 | ****  | Coffee_Bar  | Crossianwich  | t       | 2016-07-07
  2 | NaanStop     |               0.1 | ***** | Indian      | Chicken       | t       | 2016-07-12
  3 | Chipotle     |               312 | ***** | Mexican     | Burrito       | t       | 2016-06-07
  4 | Starbucks    |               0.1 | ***   | Coffeehouse | Latte         | f       | 2016-07-09
  5 | OnTheBorder  |               0.2 | ***** | General     | Tuna          | t       | 2016-07-07
  6 | NewYorkPrime |               0.5 | ***   | Steakhouse  | Crossianwich  | f       | 2016-06-07
(6 rows)

## Writing Queries

1. The names of the restaurants that you gave a 5 stars to

select * from restaurant where stars = '*****';

restaurants=# select * from restaurant where stars = '*****';
 id |    name     | distance_from_atv | stars | category | favorite_dish | takeout | last_time_i_visited
----+-------------+-------------------+-------+----------+---------------+---------+---------------------
  2 | NaanStop    |               0.1 | ***** | Indian   | Chicken       | t       | 2016-07-12
  3 | Chipotle    |               312 | ***** | Mexican  | Burrito       | t       | 2016-06-07
  5 | OnTheBorder |               0.2 | ***** | General  | Tuna          | t       | 2016-07-07
(3 rows)

2. The favorite dishes of all 5-star restaurants

select favorite_dish from restaurant where stars = '*****';

restaurants=# select favorite_dish from restaurant where stars = '*****';
 favorite_dish
---------------
 Chicken
 Burrito
 Tuna
(3 rows)

3. The the id of a restaurant by a specific restaurant name, say 'NaanStop'

restaurants=# select id from restaurant where name = 'NewYorkPrime';
 id
----
  6
(1 row)

4. restaurants in the category of 'BBQ'

select * from restaurant where category = 'BBQ';

restaurants=# select * from restaurant where category = 'BBQ';
 id | name | distance_from_atv | stars | category | favorite_dish | takeout | last_time_i_visited
----+------+-------------------+-------+----------+---------------+---------+---------------------
(0 rows)

4.b

restaurants=# select * from restaurant where category = 'Mexican';
 id |   name   | distance_from_atv | stars | category | favorite_dish | takeout | last_time_i_visited
----+----------+-------------------+-------+----------+---------------+---------+---------------------
  3 | Chipotle |               312 | ***** | Mexican  | Burrito       | t       | 2016-06-07
(1 row)

5. restaurants that do take out

select * from restaurant where takeout = 'Yes';

restaurants=# select * from restaurant where takeout = 'Yes';
 id |    name     | distance_from_atv | stars |  category  | favorite_dish | takeout | last_time_i_visited
----+-------------+-------------------+-------+------------+---------------+---------+---------------------
  1 | Octane      |                 0 | ****  | Coffee_Bar | Crossianwich  | t       | 2016-07-07
  2 | NaanStop    |               0.1 | ***** | Indian     | Chicken       | t       | 2016-07-12
  3 | Chipotle    |               312 | ***** | Mexican    | Burrito       | t       | 2016-06-07
  5 | OnTheBorder |               0.2 | ***** | General    | Tuna          | t       | 2016-07-07
(4 rows)

6. restaurants that do take out and is in the category of 'BBQ'

select takeout from restaurant where category = 'Steakhouse';

7.

8. restaurants you havent ate at in the last week

restaurants=# select current_date from restaurant;
    date
------------
 2016-07-19
 2016-07-19
 2016-07-19
 2016-07-19
 2016-07-19
 2016-07-19
(6 rows)

select name from restaurant where last_time_i_visited < current_date - interval '1 week';

restaurants=# select name from restaurant where last_time_i_visited < current_date - interval '1 week';
     name
--------------
 Octane
 Chipotle
 Starbucks
 OnTheBorder
 NewYorkPrime
(5 rows)


9. restaurants you havent ate at in the last week and has 5 stars

Restaurant DB V2
=======================

## Table

For version 2 of the restaurant database, you will have the following tables:

* restaurant
* user
* review

-- In the restaurant database we are creating 3 tables

-- Create restaurant table
restaurant=# CREATE TABLE restaurant(
restaurant(#   restaurant_id serial UNIQUE,
restaurant(#   name varchar NOT NULL,
restaurant(#   address varchar,
restaurant(#   category varchar
restaurant(# );
CREATE TABLE

-- Create users table
restaurant=# CREATE TABLE users(
restaurant(#   users_id serial UNIQUE,
restaurant(#   name varchar,
restaurant(#   email varchar,
restaurant(#   karma real NOT NULL CHECK(karma <= 7) DEFAULT 1
restaurant(# );
CREATE TABLE

-- Insert data into restaurant table
restaurant=# INSERT INTO restaurant(name, address, category) values
restaurant-#   ( 'Maggianos Little Italy', '3368 Peachtree Rd, Atlanta, GA 30326', 'Italian'),
restaurant-#   ('Chipotle Mexican Grill', '3424 Piedmont Rd NE, Atlanta, GA 30305', 'Mexican'),
restaurant-#   ('Marcos Pizza', '3330 Piedmont Rd NE, Buckhead, GA 30305', 'Pizza'),
restaurant-#   ('On The Border', '1 Buckhead Loop NE, Atlanta, GA 30326', 'Mexican'),
restaurant-#   ('NaanStop', '3420 Piedmont Rd NE, Atlanta, GA 30305', 'Indian'),
restaurant-#   ('Marcellos', 'Tuxedo Festival, 3655 Roswell Rd NE #106, Atlanta, GA 30342', 'Pizza');
INSERT 0 6

restaurant=# Select * from restaurant;
 restaurant_id |          name          |                           address                           | category
---------------+------------------------+-------------------------------------------------------------+----------
             1 | Maggianos Little Italy | 3368 Peachtree Rd, Atlanta, GA 30326                        | Italian
             2 | Chipotle Mexican Grill | 3424 Piedmont Rd NE, Atlanta, GA 30305                      | Mexican
             3 | Marcos Pizza           | 3330 Piedmont Rd NE, Buckhead, GA 30305                     | Pizza
             4 | On The Border          | 1 Buckhead Loop NE, Atlanta, GA 30326                       | Mexican
             5 | NaanStop               | 3420 Piedmont Rd NE, Atlanta, GA 30305                      | Indian
             6 | Marcellos              | Tuxedo Festival, 3655 Roswell Rd NE #106, Atlanta, GA 30342 | Pizza
(6 rows)


-- Insert data into users table
restaurant=# INSERT INTO users(name, email, karma) values
restaurant-#   ('Jake', 'jake@email.com', 6),
restaurant-#   ('Natalie', 'natalie@email.com', 7),
restaurant-#   ('Toby', 'toby@email.com', 5),
restaurant-#   ('Max', 'max@email.com', 4),
restaurant-#   ('Rob', 'rob@email.com', 6);
INSERT 0 5

restaurant=# select * from users;
 users_id |  name   |       email       | karma
----------+---------+-------------------+-------
        1 | Jake    | jake@email.com    |     6
        2 | Natalie | natalie@email.com |     7
        3 | Toby    | toby@email.com    |     5
        4 | Max     | max@email.com     |     4
        5 | Rob     | rob@email.com     |     6
(5 rows)

-- Create reviews table
restaurant=# INSERT INTO reviews(users_id, stars, title, review, restaurant_id) values
restaurant-#   (1, 5, 'jakereiview','Excellent', 1 ),
restaurant-#   (3, 4, 'nataliereview', 'Good', 4),
restaurant-#   (4, 5, 'tobyreview', 'Best', 6),
restaurant-#   (5, 3, 'maxreview', 'Bad', 4),
restaurant-#   (2, 5, 'robreview', 'Good', 5);
INSERT 0 5

restaurant=# select * from reviews;
 users_id | stars |     title     |  review   | restaurant_id
----------+-------+---------------+-----------+---------------
        1 |     5 | jakereiview   | Excellent |             1
        3 |     4 | nataliereview | Good      |             4
        4 |     5 | tobyreview    | Best      |             6
        5 |     3 | maxreview     | Bad       |             4
        2 |     5 | robreview     | Good      |             5
(5 rows)
-------


--  To connect to the table I want to work on then
\c restaurant - the table name

-- count the number of restaurants
select count(*) from restaurants;

count
-------
    6
(1 row)

-- get the average star rating for all reviews from reviews table
the total for stars is 22/no of entries 5 = 4.4
select avg(stars) from review;

avg
--------------------
4.4000000000000000
(1 row)

-- get the lowest star rating for all reviews
will get the lowest of the star ratings from thie list
select min(stars) from review;

min
-----
  3
(1 row)

-- get the average star rating by restaurant

--  First I tried this
    we are listing all the columns we want to work on.


select
  restaurant.name, reviews.stars, reviews.review
from
  restaurant, reviews
where
  restaurant.restaurant_id = reviews.restaurant_id;

  name          | stars |  review
------------------------+-------+-----------
Maggianos Little Italy |     5 | Excellent
On The Border          |     3 | Bad
On The Border          |     4 | Good
Marcellos              |     5 | Best
NaanStop               |     5 | Good
(5 rows)

--  Then get the average

restaurant_id |        avg
---------------+--------------------
            5 | 5.0000000000000000
            6 | 5.0000000000000000
            4 | 3.5000000000000000
            1 | 5.0000000000000000
(4 rows)

-- The recommendation in the next part is not to group by restaurant.name because ifthere are 2 different restaurants with same name then it will merge all the information for both the restaurants.
So, do it without restaurant.name in the group by section like above.

select
  restaurant.restaurant_id,
  restaurant.name,
  avg(stars)
from
  restaurant, reviews
where
  restaurant.restaurant_id = reviews.restaurant_id
group by
  restaurant.restaurant_id, restaurant.name;

  restaurant_id |          name          |        avg
 ---------------+------------------------+--------------------
              1 | Maggianos Little Italy | 5.0000000000000000
              6 | Marcellos              | 5.0000000000000000
              4 | On The Border          | 3.5000000000000000
              5 | NaanStop               | 5.0000000000000000
 (4 rows)




select
  restaurant.name,
  avg(stars)
from
  restaurant, review
where
  restaurant.id = review.restaurant_id
group by
  reviews.restaurant_id;
======================================

select
user_table.id as author.id,
title as title,
review as review,
stars as stars,
restaurant.id as restaurant_id,
restaurant.name as restaurant
from
restaurant,
user_table,
reviews
where
user_table.id = reviews.author_id and
restaurant.id = reviews.restaurant_id;


================================
select
  restaurant.id,
  restaurant.name,
  restaurant.address,

from
  users,
  restaurant,
  reviews
where
  review.author_id = user_table.id and
  review.restaurant_id = restaurant.id
group by
  restaurant.id
;
