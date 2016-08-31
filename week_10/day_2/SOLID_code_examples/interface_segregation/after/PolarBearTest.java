import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.assertEquals;

public class PolarBearTest{

  PolarBear bear;
  Seal food;

  @Before
  public void setup(){
    bear = new PolarBear();
    food = new Seal();
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

  public void canIceFishSeal(){
    Edible freshSeal = bear.fish();
    assertEquals(Seal.class, freshSeal.getClass());
  }

}
