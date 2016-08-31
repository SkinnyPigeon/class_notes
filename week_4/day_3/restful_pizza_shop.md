## Restful pizza shop

#### Objectives:

- Extend to an existing codebase to be RESTful
	- Add show route
	- Add edit and delete

### Recap

OK, yesterday before we knew of REST we created one half of it. If we look at our routes, we built them RESTfully. We had:

- GET route for all/'index' the orders
- GET route for the 'new' form
- POST route to 'create' an order

Today, we want to complete our RESTful app:

- A route to show individual pizza orders
- A route to an edit form and a route to update
- A route to delete a pizza order

## Show

So we can view all the orders but RESTfully we want to have a route to show each individual resource item.

What HTTP verb request is this going to be? 'GET'

```
# pizza_controller.rb

get '/pizza/:id' do
  # find pizza with specified id
  @pizza = Pizza.find( params[:id] )
  erb( :show )
end

```

- :id ; this is a dynamic path, remember? So this could be /pizza/23
- Pizza.find( params[:id] ) - is a class method
- it takes in the id as an integer - we could use this in our SQL statement and return the individual row in our database table
- @pizza allows us to use the object in our erb view

Let's create our .find class method in pizza.rb:

```
  # models/pizza.rb

  def self.find( id )
    sql = "SELECT * FROM pizzas WHERE id=#{id}"
    pizza = run_sql( sql )
    result = Pizza.new( pizza.first )

    return result
  end

```

Firstly, the setup is the same as .all. We make a connection but then our SQL is slightly different as we want to specify an ID.

Finally, we run the SQL, store the result, make it a Pizza object and then return the result.

OK, let's now binding.pry in our GET '/pizza/:id' under @pizzas = ....
We should see a single pizza object. This is useful and we can use this to render a show page. Let's create a show.erb in views and in file:

```
#terminal

touch views/show.erb
```

```
# views/show.erb

<b>Name:</b>
<p><%= @pizza.pretty_name() %></p>
<b>Order:</b>
<p><%= @pizza.quantity %> x <%= @pizza.topping %></p>
```

If we go to /pizzas/1, It should work! Wicked! Let's add a link in index.erb to view the individual pizza orders:

```
# views/index.erb

  <a href="/pizza/<%= pizza.id %>">View</a>
```

## Edit

OK, we now want to update our order. Let's say we want to change our name, quantity etc. How can we do this? 

As per REST, we need a couple of routes for this, the first is a GET:

```
# pizza_controller.rb

get '/pizza/:id/edit' do
  @pizza = Pizza.find( params[:id] )
  erb( :edit )
end

```

Our GET route takes a dynamic ID and uses the find method before rendering an :edit erb file. This means we can use the data in our form fields to render the values in the inputs. In our edit.erb:

Copy the :new form to :edit and add in the @pizza values. 

```
# terminal
cp views/new.erb views/edit.erb
```

Remember to tweak:

- action
- submit to edit
- and for each option:

```
# views/edit.erb

	<%= "selected='selected'" if @pizza.topping() == "Margherita" %>
	<%= "selected='selected'" if @pizza.topping() == "Calzone" %>
	
```

So it should now look something like:

```
# views/edit.erb

<h1>Edit Pizza Order</h1>

<form action="/pizza/<%= @pizza.id %>" method="post">
  <label for="first_name">First Name:</label>
  <input type="text" name="first_name" value="<%= @pizza.first_name() %>" >
  <label for="last_name">Last Name:</label>
  <input type="text" name="last_name" value="<%= @pizza.last_name() %>">

  <label for="topping">Select a pizza:</label>
  <select name="topping">
    <option value="Margherita" <%= "selected='selected'" if @pizza.topping() == "Margherita" %>>Margherita</option>
    <option value="Calzone" <%= "selected='selected'" if @pizza.topping() == "Calzone" %>>Calzone</option>
  </select>

  <label for="quantity">Quantity:</label>
  <input type="number" name="quantity" value="<%= @pizza.quantity() %>">

  <input type='submit' value="Update">
</form>


```

Great, notice now our for method and action is going to be sent to a different route. Let's create that route:

```
# pizza_controller.rb

post '/pizza/:id' do
  @pizza = Pizza.update( params )
  redirect to( "/pizza/#{params[:id]}" )
end

```

Here we have our POST route setup with a dynamic ID value. We have defined another class method to update our Pizza and passed the entire params to the model.

Finally we have used a sinatra method to redirect to() the GET, what will this do? Go to the GET and render the show page.

Let's create our class method to update:

```
# models/pizza.rb

  def self.update( options )
    sql = "UPDATE pizzas SET 
          first_name='#{options['first_name']}', 
          last_name='#{options['last_name']}', 
          topping='#{options['topping']}',
          quantity='#{options['quantity']}'
          WHERE id='#{options['id']}'"
    run_sql( sql )
  end

```

We setup our db connection and run our SQL. If we restart our server and run we should be able to edit and update. Woohoo!

Let's add a link to edit in show.erb:

```
# views/show.erb

<a href="/pizza/<%= @pizza.id %>/edit">Edit</a>

```

## Delete pizza

The final thing we need to do is delete from our database. We know from REST we use the delete http verb. However, because of a lack of browser support we can use POST. Firstly, because it's a post, we need to setup a form in our show:

```
# views/show.erb

<form action="/pizza/<%= @pizza.id %>/delete" method="post">
  <input type="submit" value="Delete">
</form>

```

Now we have this form, let's setup our controller action:

```
# pizza_controller.rb

post '/pizza/:id/delete' do
  Pizza.destroy( params[:id] )
  redirect to('/pizza')
end

```

and our destroy method:

```
# models/pizza.rb

  def self.destroy( id )
    sql = "DELETE FROM pizzas WHERE id=#{id}"
    run_sql( sql )
  end

```

## Conclusion:

- Practically used REST
	- Used HTTP verbs and routes
- Created and refactored database methods from the model
- Linked to a user interface view using erb


	

