# One to Many Intro

#### Objectives

- Explain what a one to many relationship is
- Demonstrate setting up a SQL database and tables with a foreign key
- See composition in action - dependency injection (with sql runner)

We are going to create a music library with Albums and Artists.

### What's the relationship?

Artist has many Albums
Album belongs to one Artist

### Setup

```
dropdb music_library
createdb music_library
mkdir music_library
cd music_library
touch console.rb
mkdir db models
touch db/music_library.sql
```


Let's start with our db table setup, inside music_library.sql:

## Making a relation happen
[i]: Much like our Jedi's that had lightsabers.  Now we want
So at the moment, our models are completely unrelated. artists know nothing about albums and albums know nothing about albums. This is sad. How can we relate a artist to a set of albums? Every good artist knows you need to keep a spare just incase some sith steals it.

This means every time a album is created, it should be given a relevant artist's id that it is attached to.

First, we need to update the sql script.

Why do we need the references keyword? It tied it to a primary key in another table, and makes sure we can't just write nonsense.

If we run the script now, we get a big fat error. We need to give it some valid ids.

```
DROP TABLE albums;
DROP TABLE artists;


CREATE TABLE artists (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id serial4 primary key,
  name VARCHAR(255),
  artist_id int4 references artists(id)
);
```

[i]: Should get error/warning here first time we run it.
```
  psql -d music_library -f db/music_library.sql
```
We create a Foreign Key by using the references keyword!

- Why do we drop table first?
  - every time we run get at clean database
- Where should we reference foreign key? Why?
  https://www.postgresql.org/docs/9.3/static/ddl-constraints.html
  - Constraint ensuring that the key relates to an element in the table in references.

- How do we create a primary key?
  - serial4, (similar to AUTO INCREMENT in other databases), default value set from sequence.
  - primary key - shorthand for multiple constraints, identical to UNIQUE NOT NULL.


## Models

We have an Artist and Album model:
```
## In terminal:
touch models/artist.rb
touch models/album.rb

## in artist.rb:

require( 'pg' )

class Album
  attr_reader( :id, :name, :artist_id )

  def initialize( options, runner )
    @id = options['id']
    @name = options['name']
    @artist_id = options['artist_id']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', '#{ @artist_id }') RETURNING *"
    album_data = @runner.run(sql)
    @id = album_data.first['id'].to_i
  end
end
```

```
## In album.rb:

require( 'pg' )
require_relative('../db/sql_runner')

class Album

  attr_reader( :id, :name, :artist_id )

  def initialize( options, runner )
    @id = options['id']
    @name = options['name']
    @artist_id = options['artist_id']
    @runner = runner
  end

  def save()
    sql = "INSERT INTO albums (name, artist_id) VALUES ('#{@name}', '#{ @artist_id }') RETURNING *"
    album_data = @runner.run(sql)
    @id = album_data.first['id'].to_i
  end

end

```
We have required a SqlRunner, like we have already seen, so let's go and set that up. This is what we use to go and run our SQL to talk to the database:


```
## In terminal:
touch db/sql_runner.rb

## In sql_runner.rb:
require('pg')
class SqlRunner
  def initialize(options)
    @dbname = options[:dbname]
    @host = options[:host]
  end

  def run(sql)
    db = PG.connect( { dbname:@dbname, host:@host } )
    result = db.exec( sql )
    db.close()
    return result
  end
end
```

It would be cool if we could use Ruby to inspect our database and see what we have, rather than running db scripts. We can achieve this using the console and Pry. In console.rb:


We are passing our runner to be used by out artists and albums.  The artist and album are delegating their responsibility of talking to the database to the runner object.  This is a very common pattern in OO. It is called Dependency Injection.

```
require_relative('./models/artist')
require_relative('./models/album')
require_relative('./db/sql_runner')


require( 'pry-byebug' )

runner = SqlRunner.new( {dbname:'music_library', host:'localhost'} )

artist = Artist.new( {'name' => "Oasis"}, runner )
artist.save()

album1 = Album.new( { 'name' => 'Definitely Maybe', 'artist_id' => artist.id }, runner )
album2 = Album.new( { 'name' => 'Whats the Story', 'artist_id' => artist.id}, runner )

album1.save()
album2.save()

binding.pry
nil
```
Now in terminal:

```
ruby console.rb
```

You'll notice that execution of the program has halted. It will sit there until we type ```continue```. We can exit using ```!!!```

If we had any variables here, we could see them with ls and do things to them.

```
#console.rb
x = 10
y = 5
```
It's a little bit like IRB, except that we can inspect the state of our program. This is really powerful!

If we have a look at our code, we should have an Artist and an Album. Our models have an "all" method on them like we have seen before, we can use this to see the database entries.

Have a play around in Pry.

Note that we could similarly just use a method to surface this, it's just a design choice. I'll show you just so you are aware of it, but don't worry about it too much.

## Retrieving our albums from artist - TASK

OK, so now we have an artist and an album related to our artist. What could we do to get back the rows of albums related to our artist?

Spend 30 minutes to work this out? GOOGLE is your friend!

In artist.rb:
```
def albums()
  sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
  albums_data = @runner.run( sql )
  albums = albums_data.map { |album_data| Album.new(album_data, @runner) }
  return albums
end
```

Now spend 30 minutes getting the artist from the album.

In album.rb:
```
def artist()
  sql = "SELECT * FROM artists WHERE id = #{ @artist_id }"
  artist_data = @runner.run( sql )
  artist = Artist.new( artist_data.first, @runner )
  return artist
end
```

#### Optional Task:

If time, complete the CRUD actions:
##all
  Now how would we get all the albums or all the artists?
  We would like to do something like Album.all, Artist.all.
  Many options. What we can do is write another class variable.
  In album.rb
  ```
    def self.all(runner)
      sql = "SELECT * FROM albums"
      albums_data = runner.run( sql )
      albums = albums_data.map { |album_data| Album.new( album_data, runner ) }
      return albums
    end
  ```

  In artist.rb
  ```
    def self.all(runner)
      sql = "SELECT * FROM artists"
      artists_data = runner.run( sql )
      artists = artists_data.map { |a| Artist.new( a, runner) }
      return artists
    end
  ```

- .all()
- .update()
- .delete()
- .find()
