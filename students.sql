CREATE TABLE student (
  -- defines a name field with the type of varchar,
  -- which is short for a variable number of characters,
  -- in other words, a string
  name varchar,
  website varchar,
  github_username varchar,
  -- defaults to 0 if not specified
  points integer DEFAULT 0,
  -- gender has type of 1 character, it's like a string
  -- of length 1
  gender char(1),
  -- cohort_start_date is a date
  cohort_start_date date,
  graduated boolean DEFAULT FALSE
);


-- Constraints are checked a insert time. The insert will fail if constraints
-- are violated.

CREATE TABLE student (
  -- NOT NULL constraint: prevents name from being unspecified, there has to have a value
  -- UNIQUE constraint: prevents there from being two rows of the same name, no duplicates
  name varchar NOT NULL UNIQUE,
  website varchar,
  github_username varchar,
  -- CHECK constraint, ensures points is greater or equal to 0, Check is like if statement
  points integer DEFAULT 0 CHECK (points >= 0),
  gender char(1),
  -- NOT NULL constraint: prevents cohort_start_date from being unspecified
  cohort_start_date date NOT NULL,
  graduated boolean DEFAULT FALSE
);


CREATE TABLE student (
  -- auto-incrementing ID, is unique, and is auto-incremented for each new row
  -- when you insert it
  -- *DO NOT* specifiy the id when you insert if you are using an auto-incrementing ID
  -- Specifying the UNIQUE constraint because serial does not require uniqueness
-- serial is an integer
  id serial UNIQUE,
  name varchar NOT NULL,
  website varchar,
  github_username varchar,
  points integer DEFAULT 0 CHECK (points >= 0),
  gender char(1),
  cohort_start_date date NOT NULL,
  graduated boolean DEFAULT FALSE
);

Some data:

insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Kyle', 'http://kyleluck.com/', 'kyleluck', 5, 'M', '2016-05-01');
insert into student (name, github_username, points, gender, cohort_start_date) values
  ('Anthony', 'Athompsonjr26', 7, 'M', '2016-05-01');
insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Matt', 'http://matthewbrimmer.com/', 'mbrimmer83', 6, 'M', '2016-05-01');
insert into student (name, github_username, points, gender, cohort_start_date) values
  ('Regan', 'rrgn', 8, 'M', '2016-05-01');
insert into student (name, github_username, points, gender, cohort_start_date) values
  ('Tim', 'tsanders30004', 7, 'M', '2016-05-01');
insert into student (name, github_username, points, gender, cohort_start_date) values
  ('Shanda', 'ShandaQ', 10, 'F', '2016-05-01');
insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Allen', 'https://www.allenhthompson.com/', 'AllenHThompson', 9, 'M', '2016-05-01');
insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Carolyn', 'http://www.carolynsdaniel.com/', 'csdaniel17', 7, 'F', '2016-05-01');
insert into student (name, website, github_username, points, gender, cohort_start_date) values
  ('Sandhya', 'https://ramsandhya.herokuapp.com/', 'ramsandhya', 10, 'F', '2016-05-01');
