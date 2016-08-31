# Template Pattern

A very common pattern you will see using Abstract Classes is the Template Pattern. It will crop up a lot in Android so we need to have a look at it.

Let's say our bears all generally have the same day. They wake up, they gather food, they eat, they sleep. The do exactly the same thing, in the same order. This is important. However, every species of bear gathers food differently. How can we achieve this?

We can use a mixture of concrete methods and abstract methods and call them in a defined order. This is an example of the Open/Closed principle in action.

What?! Let's have a go... :)

[i:] Give out the starter code.

We're going back to using a Runner, since it's easier to demo what is going on. It's the same code we made this morning, just a little stinky.

Let's now make our typical day. This method will *not* be abstract, since we are going to define specific behaviour in here. This is how we can define the order in which our methods are invoked.

```
#Runner.java
public static void main(String[] args) {
  Bear bear = new PolarBear();
  bear.typicalDay();
}

#Bear.java
public void typicalDay(){
  wakeUp();
  gatherFood();
  eat();
  sleep();
}

public void wakeUp(){
  System.out.println("Waking up");
}

public void eat(){
  System.out.println("Eating");
}

public void sleep(){
  System.out.println("Going to sleep");
}
```

These methods are also NOT abstract since they are all shared across every bear. This is exactly what we saw before with our roar method.

The interesting thing here, is that gatherFood is abstract!  We don't care about the implementation, we only care that these methods are run in order.

Let's compile and run this. It works! Happy days!

Whoot! There he goes having his typical day. Now, this is very powerful. We have allowed another developer to "hook" into our code and execute something custom, while in the background executing all of our code around it.

Let's make a GrizzlyBear. All we have to do is implement the gatherFood method, and all of a sudden he also can have a typical day.

```
#terminal
touch GrizzlyBear.java

#GrizzlyBear.java
public class GrizzlyBear extends Bear {
  
  public void gatherFood(){
    System.out.println("Off to farmfoods");
  }
  
}

#Runner.java
public static void main(String[] args) { //UPDATED
  Bear grizzlyBear = new GrizzlyBear();
  grizzlyBear.typicalDay(); 

  Bear polarBear = new PolarBear();
  polarBear.typicalDay(); 
}
```

So you can see, both bears can easily have a very similar day but have their own slight differences. They MUST implement the gatherFood method, so the abstract class can use it as if it had the implementation available to it.

If we really wanted to, we could use the @Override keyword to override the wakeUp, sleep etc methods in a particular bear.

```
#GrizzlyBear.java
@Override
public void wakeUp(){
  System.out.println("Slept in");
}
```

You can probably imagine the hideous mess you can quickly get yourself in with this. The template pattern should be used when frameworks inflict it on us, but if we can we should try to use the Strategy pattern instead.

## Android

Next week, you will see this a LOT in android. Often, we will override concrete methods in a superclass or implement abstract methods which are being used like this behind the scenes.