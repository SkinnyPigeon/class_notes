DROP TABLE bitings;
DROP TABLE zombies;
DROP TABLE victims;

CREATE TABLE zombies
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  type VARCHAR(255)
);

CREATE TABLE victims
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  run_speed INT2
);

INSERT INTO victims (name, run_speed) VALUES ('Keith',100);
INSERT INTO victims (name, run_speed) VALUES ('Rick',2);
INSERT INTO victims (name, run_speed) VALUES ('Jay',75);
INSERT INTO victims (name, run_speed) VALUES ('Valerie',75);

INSERT INTO zombies (name, type) VALUES ('Chris', 'Runner');
INSERT INTO zombies (name, type) VALUES ('Joe', 'Drooler');
INSERT INTO zombies (name, type) VALUES ('Marie', 'Walker');
INSERT INTO zombies (name, type) VALUES ('Sam', 'Drooler');