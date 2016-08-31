import static org.junit.Assert.assertEquals;
import org.junit.*;

public class BearTest {
  
  Bear bear;
  Salmon salmon;
  Human human;

  @Before 
  public void before() {
    bear = new Bear("Baloo");
    salmon = new Salmon();
    human = new Human();
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
  public void canEatHuman(){
    bear.eat(human);
    assertEquals(bear.foodCount(), 1);
  }

  @Test
  public void shouldEmptyBellyAfterSleeping(){
    bear.eat(salmon);
    bear.sleep();
    assertEquals(bear.foodCount(), 0);
  }
}