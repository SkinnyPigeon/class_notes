import static org.junit.Assert.assertEquals;
import org.junit.Before;
import org.junit.Test;

public class BlackBearTest{
  Bear bear;
  Salmon salmon;
  Human human;

  @Before
  public void before(){
    bear = new BlackBear();
    salmon = new Salmon();
    human = new Human();
  }

  @Test
  public void canEatSalmon(){
    bear.eat(salmon);
    assertEquals(1, bear.foodCount());
  }

  @Test
  public void canEatHuman(){
    bear.eat(human);
    assertEquals(1, bear.foodCount());
  }

  @Test
  public void shouldEmptyBellyAfterSleeping(){
    bear.eat(salmon);
    bear.eat(human);
    bear.sleep();
    assertEquals(0, bear.foodCount());
  }
}