import static org.junit.Assert.assertEquals;
import org.junit.*;

public class BearTest {

  Bear bear;
  Salmon salmon;
  @Before 
  public void before() {
    bear = new Bear("Baloo");
  }

  @Test
  public void hasName(){
    assertEquals("Baloo", bear.getName());
  }

  @Test
  public void bellyStartsEmpty(){
    assertEquals(0, bear.foodCount());
  }

  @Test
  public void canEatSalmon(){
    bear.eat(salmon);
    assertEquals(bear.foodCount(), 1);
  }

  @Test
  public void shouldEmptyBellyAfterSleeping(){
    bear.eat(salmon);
    bear.sleep();
    assertEquals(bear.foodCount(), 0);
  }
}