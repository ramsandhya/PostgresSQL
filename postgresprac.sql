CREATE TABLE facilities(
  facid serial UNIQUE,
  name char varying(100),
  membercost numeric,
  guestcost numeric,
  initialoutlay numeric,
  monthlymaintenance numeric
);

INSERT INTO facilities(name, membercost, guestcost, initialoutlay, monthlymaintenance) values
  ('Tennis Court 1',	5, 25,	10000,	200),
  ('Tennis Court 2',	5, 25,	8000,	200),
  ('Badminton Court', 0,	15.5,	4000,	50),
  ('Table Tennis', 0,	5,	320,	10),
  ('Massage Room 1', 35,	80,	4000,	3000),
  ('Massage Room 2', 35,	80,	4000,	3000),
  ('Squash Court', 3.5,	17.5,	5000,	80),
  ('Snooker Table', 0,	5,	450,	15),
  ('Pool Table', 0,	5,	400,	15);
______
BASIC
______

1. How can you retrieve all the information from the facilities table?

jitendraram=# select * from facilities;                                                                                     facid |      name       | membercost | guestcost | initialoutlay | monthlymaintenance
-------+-----------------+------------+-----------+---------------+--------------------
     1 | Tennis Court 1  |          5 |        25 |         10000 |                200
     2 | Tennis Court 2  |          5 |        25 |          8000 |                200
     3 | Badminton Court |          0 |      15.5 |          4000 |                 50
     4 | TableTennis     |          0 |         5 |           320 |                 10
     5 | Massage Room 1  |         35 |        80 |          4000 |               3000
     6 | Massage Room 2  |         35 |        80 |          4000 |               3000
     7 | Squash Court    |        3.5 |      17.5 |          5000 |                 80
     8 | Snooker Table   |          0 |         5 |           450 |                 15
     9 | Pool Table      |          0 |         5 |           400 |                 15
(9 rows)

2. You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

-- The result expects list of facilities and cost columns not all columns.

jitendraram=# select name, membercost from facilities;
      name       | membercost
-----------------+------------
 Tennis Court 1  |          5
 Tennis Court 2  |          5
 Badminton Court |          0
 TableTennis     |          0
 Massage Room 1  |         35
 Massage Room 2  |         35
 Squash Court    |        3.5
 Snooker Table   |          0
 Pool Table      |          0
(9 rows)

3. How can you produce a list of facilities that charge a fee to members?

-- The result expects list of all columns * means all columns where rows are sorted based on certain condition ie member cost > 0

jitendraram=# select * from facilities where membercost > 0;
 facid |      name      | membercost | guestcost | initialoutlay | monthlymaintenance
-------+----------------+------------+-----------+---------------+--------------------
     1 | Tennis Court 1 |          5 |        25 |         10000 |                200
     2 | Tennis Court 2 |          5 |        25 |          8000 |                200
     5 | Massage Room 1 |         35 |        80 |          4000 |               3000
     6 | Massage Room 2 |         35 |        80 |          4000 |               3000
     7 | Squash Court   |        3.5 |      17.5 |          5000 |                 80
(5 rows)

4. How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

-- Expected result: The column names are mentioned

select
  facid, name, membercost, monthlymaintenance
from
  facilities
 where
  membercost > 0 and
  membercost < (0.02 * monthlymaintenance);


 facid |      name      | membercost | monthlymaintenance
-------+----------------+------------+--------------------
     5 | Massage Room 1 |         35 |               3000
     6 | Massage Room 2 |         35 |               3000
(2 rows)

5. How can you produce a list of all facilities with the word 'Tennis' in their name?

select
  *
from
  facilities
 where
  name like '%Tennis%';

  facid |      name      | membercost | guestcost | initialoutlay | monthlymaintenance
 -------+----------------+------------+-----------+---------------+--------------------
      1 | Tennis Court 1 |          5 |        25 |         10000 |                200
      2 | Tennis Court 2 |          5 |        25 |          8000 |                200
      4 | Table Tennis   |          0 |         5 |           320 |                 10
 (3 rows)

6. How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

The obvious answer to this question is to use a WHERE clause that looks like where facid = 1 or facid = 2. An alternative that is easier with large numbers of possible matches is the IN operator. The IN operator takes a list of possible values, and matches them against (in this case) the facid. If one of the values matches, the where clause is true for that row, and the row is returned.

The IN operator is a good early demonstrator of the elegance of the relational model. The argument it takes is not just a list of values - its actually a table with a single column. Since queries also return tables, if you create a query that returns a single column, you can feed those results into an IN operator.


select
  *
from
  facilities
 where
  facid in (1,5);

  facid |      name      | membercost | guestcost | initialoutlay | monthlymaintenance
 -------+----------------+------------+-----------+---------------+--------------------
      1 | Tennis Court 1 |          5 |        25 |         10000 |                200
      5 | Massage Room 1 |         35 |        80 |          4000 |               3000
 (2 rows)

7. How can you produce a list of facilities, with each labelled as 'cheap' or 'expensive' depending on if their monthly maintenance cost is more than $100? Return the name and monthly maintenance of the facilities in question.


select name,
	case when (monthlymaintenance > 100) then
		'expensive'
	else
		'cheap'
	end as cost
	from facilities;

  name       |   cost
-----------------+-----------
Tennis Court 1  | expensive
Tennis Court 2  | expensive
Badminton Court | cheap
Table Tennis    | cheap
Massage Room 1  | expensive
Massage Room 2  | expensive
Squash Court    | cheap
Snooker Table   | cheap
Pool Table      | cheap
(9 rows)

CREATE MEMBER TABLE:
----------------------

CREATE TABLE members(
  memid serial UNIQUE,
  surname char varying(200),
  firstname char varying(200),
  joindate timestamp
);

INSERT INTO members(surname, firstname, joindate) values
  ('Sarwin',	'Ramnaresh', '2012-09-01 08:44:42'),
  ('Jones',	'Douglas', '2012-09-05 08:42:35'),
  ('Rumney',	'Henrietta', '2012-09-02 18:43:05'),
  ('Farrell',	'David', '2012-09-15 08:22:05'),
  ('Worthington-Smyth',	'Henry', '2012-09-17 12:27:15'),
  ('Purview',	'Millicent', '2012-09-18 19:04:01'),
  ('Tupperware',	'Hyacinth', '2012-09-18 19:32:05'),
  ('Hunt',	'John', '2012-09-19 11:32:45'),
  ('Crumpet',	'Erica', '2012-09-22 08:36:38'),
  ('Smith',	'Darren', '2012-09-26 18:08:45');

  memid |      surname      | firstname |      joindate
 -------+-------------------+-----------+---------------------
      1 | Sarwin            | Ramnaresh | 2012-09-01 08:44:42
      2 | Jones             | Douglas   | 2012-09-05 08:42:35
      3 | Rumney            | Henrietta | 2012-09-02 18:43:05
      4 | Farrell           | David     | 2012-09-15 08:22:05
      5 | Worthington-Smyth | Henry     | 2012-09-17 12:27:15
      6 | Purview           | Millicent | 2012-09-18 19:04:01
      7 | Tupperware        | Hyacinth  | 2012-09-18 19:32:05
      8 | Hunt              | John      | 2012-09-19 11:32:45
      9 | Crumpet           | Erica     | 2012-09-22 08:36:38
     10 | Smith             | Darren    | 2012-09-26 18:08:45
 (10 rows)


8. How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.


select
  memid, surname, firstname, joindate
from
  members
where
  joindate >='2012-09-01';

  memid |      surname      | firstname |      joindate
 -------+-------------------+-----------+---------------------
      1 | Sarwin            | Ramnaresh | 2012-09-01 08:44:42
      2 | Jones             | Douglas   | 2012-09-05 08:42:35
      3 | Rumney            | Henrietta | 2012-09-02 18:43:05
      4 | Farrell           | David     | 2012-09-15 08:22:05
      5 | Worthington-Smyth | Henry     | 2012-09-17 12:27:15
      6 | Purview           | Millicent | 2012-09-18 19:04:01
      7 | Tupperware        | Hyacinth  | 2012-09-18 19:32:05
      8 | Hunt              | John      | 2012-09-19 11:32:45
      9 | Crumpet           | Erica     | 2012-09-22 08:36:38
     10 | Smith             | Darren    | 2012-09-26 18:08:45
 (10 rows)
