
CREATE TABLE restaurant(
  restaurant_id serial UNIQUE,
  name varchar NOT NULL,
  address varchar,
  category varchar
);

CREATE TABLE users(
  users_id serial UNIQUE,
  name varchar,
  email varchar,
  karma real NOT NULL CHECK(karma <= 7) DEFAULT 1
);

CREATE TABLE reviews(
  PRIMARY KEY (users_id, restaurant_id),
  users_id int REFERENCES users(users_id),
  stars int NOT NULL,
  title varchar,
  review text NOT NULL,
  restaurant_id int REFERENCES restaurant(restaurant_id)
);

INSERT INTO restaurant(name, address, category) values
  ( 'Maggianos Little Italy', '3368 Peachtree Rd, Atlanta, GA 30326', 'Italian'),
  ('Chipotle Mexican Grill', '3424 Piedmont Rd NE, Atlanta, GA 30305', 'Mexican'),
  ('Marcos Pizza', '3330 Piedmont Rd NE, Buckhead, GA 30305', 'Pizza'),
  ('On The Border', '1 Buckhead Loop NE, Atlanta, GA 30326', 'Mexican'),
  ('NaanStop', '3420 Piedmont Rd NE, Atlanta, GA 30305', 'Indian'),
  ('Marcellos', 'Tuxedo Festival, 3655 Roswell Rd NE #106, Atlanta, GA 30342', 'Pizza');

INSERT INTO users(name, email, karma) values
  ('Jake', 'jake@email.com', 6),
  ('Natalie', 'natalie@email.com', 7),
  ('Toby', 'toby@email.com', 5),
  ('Max', 'max@email.com', 4),
  ('Rob', 'rob@email.com', 6);

INSERT INTO reviews(users_id, stars, title, review, restaurant_id) values
  (1, 5, 'jakereiview','Excellent', 1 ),
  (3, 4, 'nataliereview', 'Good', 4),
  (4, 5, 'tobyreview', 'Best', 6),
  (5, 3, 'maxreview', 'Bad', 4),
  (2, 5, 'robreview', 'Good', 5);
