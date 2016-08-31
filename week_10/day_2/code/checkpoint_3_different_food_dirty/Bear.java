import java.util.*;

public class Bear {
  private String name;
  private ArrayList<Salmon> bellySalmon;
  private ArrayList<Human> bellyHuman;

  public Bear(String name){
    this.bellySalmon = new ArrayList<Salmon>();
    this.bellyHuman = new ArrayList<Human>();
    this.name = name;
  }

  public String getName(){
    return name;
  }

  public int foodCount(){
    return bellySalmon.size() + bellyHuman.size();
  }

  public void eat(Salmon salmon){
    bellySalmon.add(salmon);
  }

  public void eat(Human human){
    bellyHuman.add(human);
  }

  public void sleep(){
    bellySalmon.clear();
    bellyHuman.clear();
  }


}