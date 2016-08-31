import static org.junit.Assert.*;
import org.junit.*;

public class GameTest {

  Game game;
  Rollable dice;
  
  @Before 
  public void before(){
    Rollable dice = new Dice(6);
    game = new Game(dice);
  }

  @Test
  public void testTakeTurn(){
    boolean result = game.nextTurn();
    assertEquals(false, result);
  }
  
}
