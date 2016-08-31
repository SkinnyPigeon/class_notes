import java.util.ArrayList;

public class PoohBear implements Harvester, Eater, Sleeper{

  private ArrayList<Edible> belly = new ArrayList<Edible>();

  public Edible harvest(){
    return new Honey();
  }

  public String sleep(){
    return "Zzzzz...";
  }

  public void eat(Edible food){
    if (!bellyFull()){
      belly.add(food);
    }
  }

  public int foodCount(){
    return belly.size();
  }

  public boolean bellyFull(){
    return (foodCount() >= 5);
  }

}