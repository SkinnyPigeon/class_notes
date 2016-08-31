import java.util.ArrayList;

// The Liskov Substitution Principle states that:
// In a computer program, if S is a subtype of T, then objects of type T may be replaced with objects of type S (i.e., an object of the type T may be substituted with its subtype object of the type S) without altering any of the desirable properties of that program (correctness, task performed, etc.).

// Basically it just means that other people who use our code should be able to depend on it working in the same way when given objects that inherit from the same superclass, or that implement the same interface.

// The Bear class can eat salmon and humans, but it's subclass, BlackBear, doesn't work in the same way...

public class Bear{

  private ArrayList<Edible> belly = new ArrayList<Edible>();

  public Edible eat(Edible food){
    if (!bellyFull()){
      belly.add(food);
    }
    return food;
  }

  public int foodCount(){
    return belly.size();
  }

  public boolean bellyFull(){
    return (foodCount() >= 10);
  }

  public void sleep(){
    belly.clear();
  }

}
