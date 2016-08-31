import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

public class BearTest{
  Bear bear;
  Salmon salmon;
  Human human;

  @Before
  public void before(){
    bear = new Bear();
    salmon = new Salmon();
    human = new Human();
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
    bear.eat(human);
    bear.sleep();
    assertEquals(bear.foodCount(), 0);
  }
}