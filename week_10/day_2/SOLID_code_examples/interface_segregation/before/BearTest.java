import org.junit.Test;
import org.junit.Before;
import static org.junit.Assert.assertEquals;

public class BearTest{

  Bear bear;
  Salmon food;

  @Before
  public void setup(){
    bear = new Bear();
    food = new Salmon();
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

  public void canFishSalmon(){
    Edible freshSalmon = bear.riverFish();
    assertEquals(Salmon.class, freshSalmon.getClass());
  }

  public void canFishSeal(){
    Edible freshSeal = bear.iceFish();
    assertEquals(Seal.class, freshSeal.getClass());
  }

  public void canHarvestHoney(){
    Edible freshHoney = bear.harvestHoney();
    assertEquals(Honey.class, freshHoney.getClass());
  }

  public void canHarvestBamboo(){
    Edible freshBamboo = bear.harvestBamboo();
    assertEquals(Bamboo.class, freshBamboo.getClass());
  }

}