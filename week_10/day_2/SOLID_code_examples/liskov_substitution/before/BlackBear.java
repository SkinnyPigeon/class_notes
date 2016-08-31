import java.util.ArrayList;

public class BlackBear extends Bear{

  public Edible eat(Edible food) {
    // in theory this would more violently break our program.
    // Java is really strict and won't let us break it.
    return null;
  }

  // Black Bear is not a appropriate subclass of Bear.

  // If we try to use a BlackBear in the way we would expect to use it's superclass, Bear, then it won't work. Because we can't use the null that it returns.

  // In Ruby, you might get a number back from a method that you expect a String from, when you try and call a String method on an int, it would crash. This is why we have to follow Liskov's principle.
  
}