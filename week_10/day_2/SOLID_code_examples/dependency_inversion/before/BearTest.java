import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.assertEquals;

public class BearTest{

  Bear bear;

  @Before
  public void setup(){
    bear = new Bear();
  }

  @Test
  public void hasJournal(){
    bear.getJournal().write("Dear diary, mood: apathetic...");
    assertEquals("Dear diary, mood: apathetic...", bear.getJournal().readLast());
  }

}