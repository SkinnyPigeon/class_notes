import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.assertEquals;

public class PoohBearTest{

  PoohBear bear;
  Honey food;

  @Before
  public void setup(){
    bear = new PoohBear();
    food = new Honey();
  }

  @Test
  public void canEatSalmon(){
    bear.eat(food);
    assertEquals(1, bear.foodCount());
  }

  @Test
  public void cantEatIfBellyFull(){
    for (int i = 0; i < 7; i++){
      bear.eat(food);
    }
    assertEquals(5, bear.foodCount());
  }

  public void canHarvestHoney(){
    Edible freshHoney = bear.harvest();
    assertEquals(Honey.class, freshHoney.getClass());
  }

}
