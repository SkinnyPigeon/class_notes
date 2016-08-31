import static org.junit.Assert.assertEquals;
import org.junit.*;

public class BearTest {

  Gatherer bear;

  @Before 
  public void before() {
    bear = new PolarBear();
  }

  @Test
  public void canGather(){
    assertEquals("Gone fishing", bear.gatherFood());
  }

}