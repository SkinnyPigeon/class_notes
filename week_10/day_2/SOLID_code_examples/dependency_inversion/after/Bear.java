import java.util.ArrayList;

public class Bear{

  private Journal journal;

  public Bear(Journal journal){
    this.journal = journal;
    // Now the Bear class takes any Journal type object in from outside.
    // This is much better and more flexible than newing up a concrete class.

    // Also we're now coding to an interface, rather than a concrete class.
    // This makes dependency inversion actually meaningful, as our Bear class is now more flexible.
  }

  public Journal getJournal(){
    return this.journal;
  }

  public void writeJournal(String text){
    this.journal.write(text);
  }
}