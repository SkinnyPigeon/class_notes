import java.util.ArrayList;

public class Journal{

  private ArrayList<String> entries;

  public Journal(){
    entries = new ArrayList<String>();
  }

  public void writeEntry(String entry){
    entries.add(entry);
  }

  public String getEntry(int index){
    return entries.get(index);
  }

  public String getLastEntry(){
    return getEntry(entries.size() - 1);
  }

}