import java.util.*;

public class Bear {
  private String name;
  private ArrayList<Salmon> belly;

  public Bear(String name){
    this.belly = new ArrayList<Salmon>();
    this.name = name;
  }

  public String getName(){
    return name;
  }

  public int foodCount(){
    return belly.size();
  }

  public void eat(Salmon salmon){
    belly.add(salmon);
  }

  public void sleep(){
    belly.clear();
  }


}