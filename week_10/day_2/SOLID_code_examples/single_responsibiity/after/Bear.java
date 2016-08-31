import java.util.ArrayList;

// Now our Bear is only concerned with Bear stuff, and delegates its Journal entry work to a Journal class.

public class Bear{

  private ArrayList<Salmon> belly;
  private Journal journal;

  public Bear(){
    belly = new ArrayList<Salmon>();
  }

  public void eat(Salmon food){
    if (bellyFull()){
      return;
    }
    belly.add(food);
  }

  public int foodCount(){
    return belly.size();
  }

  public boolean bellyFull(){
    return (foodCount() >= 5);
  }

  public Journal getJournal(){
    return journal;
  }

  public void setJournal(Journal journal){
    this.journal = journal;
  }

}