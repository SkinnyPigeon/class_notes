### title

Debugging

### objectives

- Understand what tools we can use to fix bugs and problems in our programs
- Introduce break point debugging

====================

This is going to be useful all the way through the course -- it's not that difficult but very powerful and will help save you time.

Ask class what types of errors they are getting?

We will encounter when programming the following types of errors:

  - syntax errors and structural
  - undefined method or local variable
  - could not convert string into fixednum

We want to produce the best programs possible. This really means code with as few bugs and problems. This could be ensuring discipline in such things as:

- Indentation; get into good habits and learn to indent code in an ordered manner
- Naming; use explicit naming for variables and functions e.g. your function name should tell us exactly what it does

There is much more besides but you will learn and pick these up as you learn more.

However, we all still run into bugs. So we need to know how to tackle them. So, debugging is the process of working through those errors and removing 'bugs' from the system.

# Debugging methods

[TASK:] Give our debugging and specs. Show how to run specs and get class members to fix tests and/or functions for 15/20 mins.

What opportunities and methods do we have of debugging?

  - Guesswork (intuition?!)
  - Process of elimination
  - Testing (manual and automatic) (irb)
  - Console output
  - Rubber duck
  - Breakpoint... someone has built a tool to help us out.

"Pry" is a debugging tool that allows us to add 'breakpoints' into our code and inspect it while it's running.

[pry][Pry]

[Pry]: http://pryrepl.org/

[bye-bug][Pry-byebug]

[Pry-byebug]: https://github.com/deivid-rodriguez/pry-byebug

```
  gem install pry pry-byebug pry-doc
```

After you've installed the gem, you may need to rehash (if you're running rbenv):

```
  rbenv rehash
```

Pry is also a direct replacement for "irb". Let's give it a try:

```
  # terminal
  pry

  # pry
  2 + 2
  => 4
```

Pry makes output a bit prettier than "irb", by using colour, and by laying things out better.

One of pry's best features is its ability to freeze the execution of a file of ruby commands, letting you take a peek inside the running program (this is called "runtime invocation").

One way of understanding how the new code works is to step through it one line at a time.

First of all, we have to "require" a gem somewhere in our code in order to use it in our program.

```
  require 'pry-byebug'
```

Let's play around with our broken code as a class.

```
def print_score( resultsArray )
  ## 1
  binding.pry
  def  transform_array( teamResult )
    return "#{teamResult[0]}: #{teamResult[2]}"
  end

  for team in resultsArray 
  	## 2
    binding.pry
    transform_array( resultsArray[team] )
  end

end

```

This is now a break point. If we run our code you will see the execution has stopped on this line. But we are in the function. This is crucial to understand this concept.

The script has run top to bottom and stoppped on this line. Everything has run before but Rubot has no idea of whats happening after.

The advantage of this debugging tool means we enjoy the scope available in this function. 

Cool, so we can ls our available variables and functions and can manipulate them to see what happens. we can ctrl + c to exit pry. 

If we put in pry point 2 now and run we are inside the function but more over we are inside the loop! We can now see the variables and what they are worth in here.

Now we can use things like step and continue to move our programs forward. Wicked!










