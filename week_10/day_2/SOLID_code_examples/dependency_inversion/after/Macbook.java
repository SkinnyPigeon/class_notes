import java.util.ArrayList;

public class Macbook implements Journal{

  private ArrayList<String> journalEntries;

  public Macbook(){
    journalEntries = new ArrayList<String>();
  }

  public void write(String text){
    this.journalEntries.add(text);
  }

  public String readLast(){
    return journalEntries.get(journalEntries.size() - 1);
  }
  
}