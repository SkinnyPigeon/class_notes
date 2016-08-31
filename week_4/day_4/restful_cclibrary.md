## Restful library

#### Objectives:

- Extend an existing codebase to be able to create many-to-many relationships
  - Review many-to-many relationships in db
  - Create views to display said data

### Recap

So yesterday we extended our music library, creating a RESTful app with one-to-many relationship. That's fine and shiny, but last week we learned about another relationship - many-to-many. 
[Q:] Ask students about possible many-to-many models (e.g. coffees-orders, pokemons-trainers, last weeks' wands and wizards, users-songs, library: books-rentals)

Since we accidentally have some codebase for a nice library, and since we all know that the future of passing on knowledge is in paper-based books, we are going to build an app to handle rentals for our CodeClan library!

## Create table

Let's work on our models and tables!

How would our models look like? 
We will need:

- Books
  - Title
  - Author
  - ID
- Members
  - Name
  - Address
  - ID
- RentedBooks, or Rentals
  - BookID
  - MemberID

First, let's create our tables in our sql file!
Let's drop tables first 

[Q:] Ask why it's important

```
DROP TABLE rentals;
DROP TABLE books;
DROP TABLE members;
```
[Q:] Ask students what would happen if we wanted do drop books table first, then the rentals!
Then let's take a look at the tables themselves! First the books and members tables:

```
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

```

Then the joined table with foreign keys

[Q:] Ask about naming conventions!

```
CREATE TABLE Rentals (
  id serial4 PRIMARY KEY, - makes sure its not null and an integer
  book_id int4 references books(id),
  member_id int4 references members(id)
);
```

Then let's look at the seed file, so we can populate our empty and sad database with life and excitement!


We have everything else set up for a basic starting point, except for one thing - Creating the db itself! Let's do it now!
In terminal:

```
createdb cclibrary
psql -d cclibrary -f db/cclibrary.sql
```

## Create Rental Model

Now that everything's wired up, let's look at our rental model! Oh wait...there is no rental model...
In terminal: 

```
touch models/rental.rb
```

Open it and fill the void with the following:
```
require('pg')
require_relative('../db/sql_runner')


class Rental

  attr_reader :id, :book_id, :member_id

  def initialize( options )
    @id = options['id'].to_i
    @book_id = options['book_id'].to_i
    @member_id = options['member_id'].to_i
  end

end
```

Now we can instantiate a few Rental object, but we don't struggle with SQL just because we enjoy suffering, so let's create our save method!

```
def save()
  sql = "INSERT INTO Rentals (book_id, member_id) VALUES (#{@book_id}, #{member_id}) RETURNING *"
  rental = SqlRunner.run_sql(sql).first
  return Rental.new(rental)
end
```
[Q:] Ask why we don't need quotes around the interpolation

Great! Now that we have our save method, we can create a few entries in the seed file. It's good for checking if everything is hooked up nicely.

```
rental1 = Rental.new({'book_id' => b1.id, 'member_id' => m2.id})
rental2 = Rental.new({'book_id' => b2.id, 'member_id' => m1.id})
r1 = rental1.save
r2 = rental2.save
```

Let's run our seed file from the terminal, then check our database if it works nicely.

## Work in browser

Great! Now we can add rentals. We were able to do this last week as well. But now we can ask our favorite singer to aid us in a more visual way. Let's kick up our server, then jump in the browser!
As you can see we have a nice little home page, everything is working nicely - Except the rentals.

Let's create an index page for all our existing rentals.
In terminal:

```
mkdir views/rentals
touch views/rentals/index.erb
```

Now let's try and go to http://localhost:4567/rentals. What happens? Sinatra doesn't know this ditty? Then teach him!
We obviously lack an important part of our program - no controller for our rentals. Let's make it!

```
touch controllers/rentals_controller.rb
```

Open it up and create our index action!
```
require_relative('../models/rental.rb')

get '/rentals' do
  @rentals = Rental.all()
  erb :'rentals/index'
end
```

Ahh, but there's a function we don't have in our Rental class! Let's make our .all function in rental.rb. Don't forget to include our nifty map_item/map_items as well!

```
def self.all()
  sql = "SELECT * FROM Rentals"
  return Rental.map_items(sql)
end

def self.map_items(sql)
  book = SqlRunner.run_sql(sql)
  result = book.map { |product| Rental.new( product ) }
  return result
end

def self.map_item(sql)
  result = Rental.map_items(sql)
  return result.first
end
```

Now let's look at our index.erb for our rentals, and try to print out all our current rentals.

In index.erb
```
<% @rentals.each do |rental| %>
  <% rental.book_id %>  <% rental.member_id %>
<% end %>
```

As you can see, here are all the rentals we have set up so far in the seeds file. 
How about creating something without the tedious job of typing it in the seedfile, or do everything manually? What we want to do is to see the members, see the existing books, then pairing them up creating rentals. 
[Q:] Ask what's the best way to display this data in html (hint: dropdown menus)

We can do this if we create a new form for our rentals.

In terminal:
```
touch views/rentals/new.erb
```

In our rentals_controller.rb :
```
get '/rentals/new' do
  @books = Book.all()
  @members = Member.all()
  erb :'rentals/new'
end
```

Now that our rental/new knows what the books/members are, let's ask him nicely to display all our data tidied up!

In views/rentals/new.rb
```
<h2>New Rental</h2>

<form action="/rentals" method="post">
  <label for="book_id">Book:</label>
  <select name="book_id">
  <% @books.each do |book| %>
    <option value="<%= book.id %>"><%= book.title %></option>
  <% end %>
  </select>
  <label for="member_id">Member:</label>
  <select name="member_id">
  <% @members.each do |member| %>
    <option value="<%= member.id %>"><%= member.name %></option>
  <% end %>
  </select>
  <input type='submit' value="Add Rental!">
</form>
<br>
<br>
<a href="/">Back</a>
```
[Q:] Ask/explain what is going on 

Now we have the form, but our controller is sad and lonely, we are missing his pair - the post method!

In our rentals_controller.rb: 
```
post '/rentals' do
  @rental = Rental.new(params)
  @rental.save
  redirect to( "rentals" )
end
```


Now let's try adding some new rentals, then check rentals/index.erb to see our freshly added rentals. You can add new members/books via the appropriate forms, then these will appear in our dropdown-menus as well in the rentals/new.erb.

Ok, so we created a new SQL table, index file, new form and controllers with appropriate actions. It looks beautiful. 

...Or is it?

Look at rentals/index.erb. This isn't really informative now, is it?

Let's see what we can do to make it look pretty!

Instead of seeing id pairs, how about we try to display the appropriate book and member for each rental object?

Let's see how we can do this!

[Q:] Ask if they remember last week's pokemon example

Let's write the function to display the required info!

In our rental.rb:
```
def book()
  sql = "SELECT * FROM books WHERE id = #{@book_id}"
  return Book.map_item(sql)
end

def member()
  sql = "SELECT * FROM members WHERE id = #{@book_id}"
  return Member.map_item(sql)
end
```

Now let's go back to our rentals/index.erb, and change it around a bit with our crispy new functions!

```
<% @rentals.each do |rental| %>
ID: <%= rental.id %> BOOK: <%= rental.book.title %> MEMBER: <%= rental.member.name %><br>
<% end %>
```

[Q:] Ask students to create method for returning all books associated with member/vice versa (inner joins!).
[Q:] If there is time, think about edit/update






























