import static org.junit.Assert.assertEquals;
import org.junit.Test;
import org.junit.Before;

public class CircusBearTest{
  CircusBear circusBear;
  Salmon salmon;
  Steak steak;
  TopHat hat;


  @Before
  public void before(){
    circusBear = new CircusBear();
    salmon = new Salmon();
    steak = new Steak();
    hat = new TopHat();
  }

  @Test
  public void canEat(){
    circusBear.eat(salmon);
    assertEquals(1, circusBear.foodCount());
  }

  @Test
  public void cannotEatWhenBellyFull(){
    for (int i = 0; i < 12; i++){
      circusBear.eat(salmon);
    }
    assertEquals(10, circusBear.foodCount());
  }

  @Test
  public void canDance(){
    assertEquals("This is my dancing, don't laugh, bears aren't built for this.", circusBear.dance());
  }

  @Test
  public void canEatTreatWhileDancing(){
    circusBear.dance();
    circusBear.eat(steak);
    assertEquals(1, circusBear.foodCount());
  }

  @Test
  public void cannotEatTreatUnlessDancing(){
    circusBear.eat(steak);
    assertEquals(0, circusBear.foodCount());
  }

  @Test
  public void cannotEatTopHat(){
    circusBear.eat(hat);
    assertEquals(0, circusBear.foodCount());   
  }
}