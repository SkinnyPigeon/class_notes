DROP TABLE pokemons;
DROP TABLE trainers;

CREATE TABLE trainers (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE pokemons (
  id serial4 primary key,
  name VARCHAR(255)
);