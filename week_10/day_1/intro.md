#Introduction

##Learning Objectives
 - Describe how statically typed differs from dynamically typed
 - Describe how compiled languages differ from interpreted languages.
 - Write, compile and run a Java program.

##Introduction
  Continue with OO programming but with a twist.
  In Ruby we wrote class based OO.
  Ruby is a dynamically typed language. What does this mean?

##Dynamically Typed

```
#terminal
  touch ruby_play.rb
```

```
#ruby_play.rb
  class Cat
  end

  class Dog
  end

  myCat = Cat.new
  myCat = Dog.new
```

```
#terminal
  ruby ruby_play
```

  The variable myCat has been assigned to first a Cat object and then a dog object.  Ruby has no problem with this. Variables are just variables they don't care what type of object they refer to.  Ruby is chill.

##Statically Typed

  Statically types languages are much more up tight.  Variables need to know what they are referring to, and always have to refer to that type.

```
#terminal
  touch Runner.java Cat.java Dog.java
```

  [i]:  This is the method we have to write to start Java program.  We will understand what all those words mean over the week.

```
#Runner.java
  class Runner{
    public static void main(String[] args){
      Cat myCat = new Cat();
      myCat = new Dog();
    }
  }

```

```
#Cat.java
  class Cat{
  }
```

```
#Dog.java
  class Dog{
  }
```

```
#terminal
  javac *.java
```

Let's focus on line 3 in Runner.java.  Here we are creating a myCat variable and assigning it to a Cat object.  What's different here from the Ruby version?  The variable has been given a type Cat.  Because this variable is for this type and this type only, we can't assign it to a Dog object.

[Expected:  Why would a language ask for this]
Statically typed languages give us an extra level of protection.  We can be sure that the type we are given is what we expect.  This will come more apparent when we are creating functions/methods.


##Compilation
Notice we typed the word javac.  This stands for java compiler.  Most statically typed languages involve a compilation step.  It is here that the type checking happens, among other checks.  Remember those,  'no method errors' in Ruby.  All these errors will be caught at compile time, in a statically typed compiled language. It also gives us the ability for much more powerful tooling as our editor/IDE can tell us when something is of the wrong type immediately.  We will see this later on.

To run a program we first compile it and then run it. Using '*.java' runs javac on all the files with a .java extension, saving us having to type out each file separately. 

```
#Runner.java
  class Runner{
    public static void main(String args[]){
      Cat myCat = new Cat();
    }
  }
```

```
#terminal
  javac *.java
```

Our compilation succeeds.  The compiler is happy that the variable types match the objects they are referencing.  The compiler produces 'not for humans' files, which can now be executed.

```
#terminal
  java Runner
```

We have run our first program.  No output!  Let's give the cat a little meow method.

```
#Cat.java
  class Cat{
    public void meow(){
      System.out.println("Hello Meooooow");
    }
  }
```

System.out is just like puts (ruby) or console (JS).
Let's ask our cat to meow!

```
#Runner.java
  class Runner{
    public static void main(String args[]){
      Cat myCat = new Cat();
      myCat.meow();
    }
  }
```
