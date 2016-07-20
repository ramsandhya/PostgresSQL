

CREATE TABLE restaurant(
  id serial UNIQUE,
  name varchar NOT NULL,
  distance_from_ATV real,
  stars varchar,
  category varchar,
  favorite_dish varchar,
  takeout boolean,
  last_time_I_visited date
);

insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
  ('Octane', '0.00', '****', 'Coffee_Bar', 'Crossianwich', 'Yes', '07,07,16');
insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
  ('NaanStop', '0.10', '*****', 'Indian', 'Chicken', 'Yes', '07,012,16');
insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
  ('Chipotle', '312', '*****', 'Mexican', 'Burrito', 'Yes', '06,07,16');
insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
  ('Starbucks', '0.10', '***', 'Coffeehouse', 'Latte', 'No', '07,09,16');
insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
  ('OnTheBorder', '0.20', '*****', 'Mexican', 'Tuna', 'Yes', '07,07,16');
insert into restaurant (name, distance_from_ATV, stars, category, favorite_dish, takeout, last_time_I_visited) values
  ('NewYorkPrime', '0.50', '***', 'Steakhouse', 'Crossianwich', 'No', '06,07,16');
