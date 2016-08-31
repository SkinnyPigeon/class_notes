import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.assertEquals;

public class JournalTest{

  Bear bear;
  Journal journal;

  @Before
  public void setup(){
    journal = new Journal();
  }

  @Test
  public void canWriteJournalEntry(){
    journal.writeEntry("Dear Diary, I wrote some Java classes today.");
    assertEquals("Dear Diary, I wrote some Java classes today.", journal.getLastEntry());
  }
}