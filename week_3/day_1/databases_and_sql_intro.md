### title

Databases and SQL Introduction

# Databases

### Objectives

 - Understand what a database is
 - Explain what SQL is
 - Know how to use CRUD
 - Know how to create relationships
 - Undertand INNER JOINS

## What is a database?

A database is just somewhere for us to store our data. There are many different shapes and sizes of database. SQL is a language which is often used to query these databases and that's what we will be learning today.

## What do we do with databases

What do we store in databases?
[i:] Get the students to make some suggestions

[i:] Ensure you write the "CRUD" operations on the board under each other as the class suggest them, to read the acronym off vertically. Later, we will align these with the SQL commands written next to them.

 What sorts of manipulations do we make to data in databases?

 - Create (we can't do anything unless we can put data in)
 - Read (once it's in there, we need to get it out)
 - Update (if it needs to change, we need to be able to change it)
 - Delete (we'll need to be able to remove data from our database)

We refer to these four operations as "CRUD". This is important since you will come across it later when we begin web programming

[i] As you work through the sql commands, tick these off.

## What is SQL?

"SQL" stands for "Structured Query Language" (pronouced either as "ess-queue-ell" or "sequel"). In the same way that we use Ruby to talk to the computer, we can use SQL to talk to a database.

## PostgreSQL

SQL is just a language - we need an engine to run it on. In the same way that Ruby is just a language, that runs on an "interpreter" - our Ruby robot we spoke about before.

PostgreSQL is an open source object-relational database system that we will be using on the course.

To check that psql is installed, we can type this.

```
  # terminal
  which psql
```

[i:]If there are any issues with running `psql`, ensure that the `postgresapp` is installed and running (it should have been configured in installfest), and that the path is updated to include it - launch `psql` from the system icon, and note the path used.

```
  # terminal
  psql
  \q  -- to quit
```

## Structure

In SQL, a database is a collection of "tables". A table is a collection of "columns" and "rows".

A table describes the type of item that we want to store. A column represents some information we might find interesting about that item. A row is the physical data we want to save.

[i:] Draw this on the board

For example, we might have a Zoo database with a table called Animals. The animals table might have the columns Name, Age and Colour. The animals table might have the row "Leon, 12, Red".

## Creating a database

To work with data in databases we perform the four CRUD operations.
So we'll work through the SQL commands that give us that functionality.

Before we can do anything though, we need to create a table to store our records in. But before we can create a table, we have to create a database to put it in!

```
  # psql
  psql
  create database star_wars; /* REMEMBER COLON **/
  \q
```

## Data Types

So before we run off and create lots of shiny tables, we need to talk about datatypes. You'll be glad to hear they roughly match up to what we have already seen in Ruby. There are many data types we can use in SQL - the most common we will be using are:

* VARCHAR - fixed length text (string)
* INT - numerical data (fixnum)
* BOOLEAN - true / false data (trueclass, falseclass, booleans)

We can pass arguments to VARCHAR and INT to say how large we want the data in the field to be as a maximum.

# Creating tables

By convention, we will name our database tables as the plural of the thing we are creating. So rows of animal data would be stored in a table called Animals. Sheep would be stored in a table called... well, sheep.

Let's make a table that's going to store data about jedi. A jedi might have the following attributes:

- name
- darkside (true / false)
- age

[i:] Get the students to think about what types these columns will be.

Before we create a table, we will drop it so that we can run our script multiple times. PostGres won't let you create a table that already exists.

```
  touch jedi.sql

  #jedi.sql
  DROP TABLE jedi;

  CREATE TABLE jedi (
    name VARCHAR(255),
    darkside BOOLEAN,
    age INT2
  );

```

- What is our table called?
- What are the names of our columns?
- What are the size constraints?

There is a special command that we can run from the terminal to execute postgres scripts.

```
  #terminal
  psql -d star_wars -f jedi.sql

  #psql terminal - new tab, keep this open for running selects
  psql

  \c star_wars
  \d+ star_wars

```
We will write all of our statements in the one file and comment them out, so you can keep the story of what we are working through.


## Creating (-C-rud)

[i:] Remember to tick off the CRUD items on the board

We're going to start with the C in CRUD but first let's learn the SQL statement that you'll probably use most of all.

```
#jedi.sql
SELECT * FROM jedi;
```

[i:] You may want to comment out select statements as you go, so only the latest one is shown. I usually just keep moving the sleect down the script as we go.

This says 'get everything from the jedi table'. The * means 'all the fields'.

To "create" records in SQL, we use the `INSERT` clause.

We are going to make a lot of use of the Sublime shortcuts cmd + D to copy a line as well as cmd + / to comment a line.

```
  #jedi.sql
  INSERT INTO jedi (name, darkside, age) VALUES ('luke',false, 21);
  /** SEMI COLONS! **/
  INSERT INTO jedi (name, darkside, age) VALUES ('vader',true, 100);

  #terminal
  psql -d star_wars -f jedi.sql

  #jedi.sql
  SELECT * FROM jedi;

```

Note that the INSERT 1 0 is that 1 row was inserted with an id of 0 (has no id, more on this later).

We need to be careful with speechmarks in postgres sql - we should always use single quotes. Single quotes behave in the normal way we'd expect - defining text. Double quotes are reserved for system operations. Try not to worry too much about this, just remember to use single quotes when dealing with data.

If we ever need to use a speechmark in our inserted text, we need to escape it with a backslash or use two of them.

We use the convention uppercase for SQL keywords and lowercase for our own terms. It's not mandatory but it makes it easier to read.

## Inserting nulls

What would happen if we do this?

```
  #jedi.sql
  INSERT INTO jedi (name, age) VALUES ('obiwan', 33);

  #terminal
  psql -d star_wars -f jedi.sql

  #jedi.sql
  SELECT * FROM jedi
```
Notice that the value for darkside is null. Any values which are not passed in are set to null.

## Selecting (c-R-ud)

This is the R is CRUD.

We have been "reading" records with the `SELECT` clause.

```
#jedi.sql
SELECT * FROM jedi;
```
The star is saying that we want all the fields returned, if we said

```
#jedi.sql
SELECT name FROM jedi;
```

It would only list the ages.

We can also use SELECT to count how many rows we have

```
#jedi.sql
SELECT COUNT(*) FROM jedi;
```

# Updating (cr-U-d)

This is the U in CRUD.

We use the `UPDATE` clause to change the values in existing records.

```
  #script.sql
  UPDATE jedi SET darkside = true;

  #terminal
  psql -d star_wars -f jedi.sql

```

Note that it says UPDATE 3 - what does this mean?

This has updated all our records (3 of them)...what if we only want certain records to update?

We can use a **where** clause to achieve this.

```
  #script.sql
  UPDATE jedi SET darkside = false WHERE name = 'luke';

  #terminal
  psql -d star_wars -f jedi.sql
```

We can be even more explicit and using the AND keyword

```
  #jedi.sql
  UPDATE jedi SET darkside = false WHERE name = 'obiwan' AND age = 33;

  SELECT * FROM jedi;

  #terminal
  psql -d star_wars -f jedi.sql

```

[TASK:]
- Add a new jedi "Anakin" with age 12 and darkside set to false.
- Update anakin to be age 22
- Update anakin's darkside to be true

```
INSERT INTO jedi (name, darkside, age) VALUES ('anakin', false, 12);
UPDATE jedi SET age = 22 WHERE name = 'anakin';
UPDATE jedi SET darkside = true WHERE name = 'anakin' AND age = 22;
```


# Deleting (cru-D-)

This is the D in CRUD.

To delete records we use the `DELETE` clause. But **be careful**, there's no undo! When a record is deleted from a DB it's gone for ever. "Undelete" in the database world is "restore from last night's backup" (if there *was* a backup...)

```
  #jedi
  DELETE FROM jedi WHERE name = 'luke';
  SELECT * FROM jedi;

  #terminal
  psql -d star_wars -f jedi.sql;
```
[Task:] Add a jedi and then delete it

# Uniquely identifying rows

What happens if we had 2 jedis with the same name and age? It's unlikely but it could happen.

```
#jedi.sql
INSERT INTO jedi (name,lightsaber,darkside) VALUES ('obiwan',false, 32);

#terminal
psql -d star_wars -f jedi.sql;
```
So it's 32 year old obiwans birthday. How do we uniquely identify him in the database to update him?
```
#jedi.sql
UPDATE jedi SET age = 33 WHERE name = 'obiwan' AND age = 32;

#terminal
psql -d star_wars -f jedi.sql;
```

That's grand but what happens when the other Obiwan's birthday comes along? We have no way of uniquely identifying this row, and any query we try to execute will update both Obiwans.

Oops.

The answer to this is to add a column to every table when we create it. That column will contain a number, which will be unique for each row in the DB, and ideally, is managed by the database itself, so we don't need to worry about adding it when we insert new records.

## Serials

We are going to need an ID column, to solve our problem of uniquely identifying rows.

The new `id` field is a `SERIAL8` type -- an internal type of PostgreSQL's, which will look after numbering for us in an eight byte integer field. This gives us up to 9 million trillion ids which is probably enough.

Serials are super special integers, that auto increment themselves. If we had simply used INT, we'd have to manually curate them and make sure we added 1 (which would be horrible). This would also cause issues if we had concurrent users - what if they both made a row at the same time? Serials take care of this nightmare for us.

Note that different database engines handle this in different ways, serials are a PostGRES specific construct which other engines might use.

Let's update our jedi

```
#jedi.sql
CREATE TABLE jedi (
  id SERIAL8,
  name VARCHAR(255),
  darkside BOOLEAN,
  age INT(2)
);
```
If we run our script now we should see something cool. Each of our entries magically has a unique id, and we didn't need to do anything to manage it.

## Lightsabers

Let's create a table to store the lightsabers of our jedi.

Lightsabers will have

- hilt_metal
- colour
- owner name

[i:] Ask the students to determine what type these columns will be.

Let's add a new table at the top of our file and comment out the queries we wrote earlier.
```
  #jedis.sql
  /** Above DROP TABLE jedi **/
  DROP TABLE lightsabers;

  /** Just below CREATE TABLE jedi **/  
  CREATE TABLE lightsabers (
    id SERIAL8,
    hilt_metal VARCHAR(255),
    colour VARCHAR(255),
    owner VARCHAR(255)
  );

  #terminal
  psql -d lightsabers -f lightsabers.sql

```

Aside: You will often see 255 used because it's the largest number of characters that can be counted with an 8-bit number. It maximizes the use of the 8-bit count, without frivolously requiring another whole byte to count the characters above 255. We'll come back to binary another time.

```
 #jedi.sql
  INSERT INTO lightsabers (colour, owner, hilt_metal) VALUES ('green', 'joda', 'palladium');
  INSERT INTO lightsabers (colour, owner, hilt_metal) VALUES ('green', 'luke', 'gold');

  SELECT * FROM lightsabers;
  #terminal
  psql -d star_wars -f jedi.sql

#psql terminal
SELECT * FROM lightsabers;
```
[Task:] Add a lightsaber

# Constraints

We can add "constraints" to our table definition, which will validate the data we try to enter against some basic rules.

  - A lightsaber must have a colour and a hilt metal

```
  #lightsabers.sql

  CREATE TABLE lightsabers (
    id SERIAL8,
    colour VARCHAR(255) not null,
    owner VARCHAR(255) not null,
    hilt_metal VARCHAR(255) not null
  );

 #terminal
  psql -d star_wars -f jedi.sql

```

Let's try to insert some invalid data.

```
INSERT INTO lightsabers (colour) VALUES ('red');

 #terminal
psql -d star_wars -f jedi.sql
```


[i]: Break here before going on to foreign keys


## Primary Keys

We associated pets with owners by adding the owner's name to the pets table. Can you anticipate anything wrong with this?

  - Duplication - If an ownner changes their name, it needs to be changed everywhere
  - What if two people have the same name?

What other solution could we use? Instead of storing the owner's name, what about storing the ID of their row in the jedi table?

If we want to use an ID, it's important that we make sure that every row has an ID. Currently, we could set the ID field of our lightsabers to be null or a duplicate value.

```
UPDATE lightsabers SET ID = 1
```

Luckily, postgres has a way to prevent this.

A primary key is a column that uniquely defines a record. A primary key column cannot contain a NULL value. A table can have only one primary key. So we are explicitly saying that we want our ID field to be our main identifier for the rows in the table.

```
  #lightsabers.sql
  CREATE TABLE lightsabers (
    id SERIAL8 primary key, //UDATED
    colour VARCHAR(255) not null,
    owner VARCHAR(255) not null,
    hilt_metal VARCHAR(255) not null
  );

  CREATE TABLE jedi (
    id SERIAL8 primary key, //UPDATED
    name VARCHAR(255),
    darkside BOOLEAN,
    age INT
  );

 #terminal
  psql -d star_wars -f jedi.sql

```

Now we can't alter it like we just did.

```
UPDATE lightsabers SET ID = 1
```

## Foreign Keys

We can now use this primary key as an identifier in another table. When we do this we refer to it as a 'foreign key'. It's simply a primary key from another table.

[i:] draw this on the board (one to many)

```
 #jedi.sql

  CREATE TABLE lightsabers (
    id SERIAL8 primary key,
    colour VARCHAR(255) not null,
    owner_id INT8 references jedi(id), //UPDATED
    hilt_metal VARCHAR(255) not null
  );

```

We can see that the jedi table now has a serial id and the pets table now has a "references jedi(id)" statement. Our owner_id is a reference to the primary key in the jedi table.

Foreign keys are generally named according to the convention "table_name_singular_id", unless another name makes more 'sense' (but it would always have `_id` to indicate it's a foreign key).

Now, before we do anything else - what happens if we change the order of the drops and run this again? Because lightsabers now depends on people, if we want to delete the people table we must remove any tables that depend on it's primary keys.

Otherwise we'd end up with a whole bunch of zombie references to it.  Let's fix that up and put it back in the correct sequence.

If we inspect our newly created rows, we can see the ids of the owners. Let's use these to create some pets.

```
#jedis.sql
SELECT * FROM jedi; //find the ids

INSERT INTO lightsabers (colour, owner_id, hilt_metal) VALUES ('green', 1, 'palladium');

INSERT INTO lightsabers (colour, owner_id, hilt_metal) VALUES ('red', 2, 'gold');

 #terminal
 psql -d star_wars -f jedi.sql

```

What happens if we try to add a lightsaber with an id of 4?

```
#jedis.sql
INSERT INTO lightsabers (colour, owner_id, hilt_metal) VALUES ('red', 4, 'gold');
```

We get an error, as we would expect.

This is what we call a ONE TO ONE relationship. ONE id in the jedi table is referenced by ONE id in the foreign key of the lightsabers table. There is actually a way to constrain it and make it so that a jedi can have one and only one lightsaber - look up "postgres sql constraints" if you are interested.

A jedi can easily have many lightsabers, by adding a new entry to the lightsaber table. So we also have a ONE to MANY relationship going on.

However, how could we have a lightsaber being owned by many jedi? We'd have to add owner_id2, owner_id3 etc. What if they had 100 owners?

This is where "join tables" come in.

#Joins
What if we wanted to see information from multiple tables. In our case Jedi's and their lightsabers.
```
SELECT * FROM jedi;
SELECT * FROM lightsabers;
```
This gives us the information, but we then have to manually match which lightsaber belongs to.  Imaging this when we have thousands/millions of rows.

To save us this nightmare, SQL gives us commands to see the data across multiple tables combined.  This is called joining the tables.
```
SELECT * FROM jedi, lightsabers; -- pretty useless cross join check all of these
```

Inner Join is the most common join we will use.  It is inner because if anything is missing.  Say we have a Jedi with no lightsaber. Or a lightsaber with no Jedi. They will be left out.  We tell it what we want to match on.

```
SELECT * FROM jedi INNER JOIN lightsabers on jedi.id = lightsabers.owner_id;
-- WHERE name = 'luke';
-- inner join will only show the values that non null values,
-- anakin won't show up here becauase no matching lightsaber.

-- if they ask, can show left outer join.
SELECT * FROM jedi LEFT OUTER JOIN lightsabers on jedi.id = lightsabers.owner_id;
```

# Many to Many - Join tables

I think we've had about enough of jedis and lightsabers now, so let's do something different.

Let's create a new database to model a zombie apocalypse. We want to keep track of which victims have been bitten by which zombies and whe it happened. Looking at the description of what our DB will do, all the nouns indicate tables we'll need.

Zombies will have
- a name
- a type
- an id

Victims will have
- a name
- infection date

[i:] draw this on the board (many to many)

Now zombie's can bite multiple people, and people can be bitten by multiple zombies (ouch) so we can't simply add a person_id to a zombie or a zombie_id to a person. What are we going to do?

This is where the magic of join tables comes in.

```
#psql terminal
CREATE DATABASE zombies;

 #terminal
 psql -d zombies -f zombies.sql
```
This is fine, but we need some way to marry the two tables together. A zombie can bite many victims and a victim can be bitten by many zombies.

```
/** First droppped table **/

DROP TABLE BITINGS

/** Last created table **/
CREATE TABLE bitings
(
  id SERIAL8 primary key,
  victim_id INT8 references victims(id),
  zombie_id INT8 references zombies(id),
  infected_on DATE not null
);
```

Now let's add some unfortunate incidents to the bitings table.
```
#zombies.sql CHECK THESE IDs exist in your db!!!
INSERT INTO bitings (zombie_id, victim_id, infected_on) VALUES (1, 1, 'Jan 12 2015');
INSERT INTO bitings (zombie_id, victim_id, infected_on) VALUES (2, 2,'Jan 13 2015');
INSERT INTO bitings (zombie_id, victim_id, infected_on) VALUES (3, 3, 'Jan 14 2015');

--zombie 1 went on a killing spree
INSERT INTO bitings (zombie_id, victim_id, infected_on) VALUES (1, 2, 'Jan 12 2015');
```

How do we find out the names of the people who have been bitten by Chris?
```
  #zombies.sql
  -- First, find out the ID of chris.
  SELECT * FROM zombies WHERE name = 'Chris';

  -- We just want the victim_id for our purposes.
  SELECT victim_id FROM bitings WHERE zombie_id = 1;

  -- Now we can get the people's names from the person_ids. Note that (2,3) is kind of like an array.
  SELECT name FROM victims WHERE id IN (1,2);
 ```

We had to execute three queries here to get the data we wanted, which isn't very efficient. But it got us there.

# An intro to the dark art of joins

There are several kinds of joins but we are just going to have a quick look at inner joins for now.

[i:] Draw 2 circles, one for victims and one for bitings. Show the overlap being the inner join - where the id is present in both tables.

If we wanted to list all the victims names and when they were infected we could do this

```
#zombies.sql
select victims.name, bitings.infected_on from victims inner join bitings on bitings.victim_id = victims.id;

```
We can use this to more elegantly get all of the victims bitten by Chris.

```
#zombies.sql
select name from victims inner join bitings on victims.id = bitings.victim_id where bitings.zombie_id = 1;
```

This is fine, but what if we don't know what the zombie id is we only know his name is Chris?

```
#zombies.sql
select victims.name from victims inner join bitings on victims.id = bitings.victim_id inner join zombies on zombies.id = bitings.zombie_id where zombies.name = 'Chris';

```

We can also do some cool stuff like count how many times Chris has bitten someone

```
#zombies.sql
select count(bitings.victim_id) from bitings inner join zombies on zombies.id = bitings.zombie_id where zombies.name = 'Chris';

```

## Bonus Points

For your own learning, I recommend you have a look into the other kinds of joins and also aliasing - this saves us typing out the table names every single time.

You might also like to look into how to order and group results.

Some reading:

https://blog.codinghorror.com/a-visual-explanation-of-sql-joins/
