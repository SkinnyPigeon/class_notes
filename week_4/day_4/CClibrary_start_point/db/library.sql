DROP TABLE books;
DROP TABLE members;


CREATE TABLE books(
  id serial4 PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255)
);

CREATE TABLE members (
  id serial4 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255)
);