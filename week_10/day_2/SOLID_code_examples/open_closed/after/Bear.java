import java.util.ArrayList;

public class Bear{

  private ArrayList<Edible> belly = new ArrayList<Edible>();

  public void eat(Edible food){
    if (!bellyFull()){
      belly.add(food);
    }
  }

  public int foodCount(){
    return belly.size();
  }

  public boolean bellyFull(){
    return (foodCount() >= 10);
  }
}