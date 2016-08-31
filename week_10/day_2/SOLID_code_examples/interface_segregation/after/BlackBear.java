import java.util.ArrayList;

public class BlackBear implements Fisher, Eater, Sleeper, Climber{

  // Now our interfaces are all nicely split up, each defining a specific behaviour.
  // These interfaces can be combined to enforce the behaviour required of specific types of Bear.
  // There is no master "Bear" class which can do everything that Bears can do.

  private ArrayList<Edible> belly = new ArrayList<Edible>();

  // The Fisher interface forces us to implement a method named "fish", taking no arguments and returning an Edible type object. However the specific implementation of this method is up to the implementing class to define.
  public Edible fish(){
    return new Salmon();
  }

  public String sleep(){
    return "Zzzzz...";
  }

  public String climb(){
    return "I can climb this tree, you can't hide from me!";
  }

  public int foodCount(){
    return belly.size();
  }

  public boolean bellyFull(){
    return (foodCount() >= 5);
  }

  public void eat(Edible food){
    if (!bellyFull()){
      belly.add(food);
    }
  }

}