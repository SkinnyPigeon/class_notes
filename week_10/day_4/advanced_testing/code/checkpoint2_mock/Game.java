public class Game {
  Rollable dice;
  int turnCount;

  public Game(Rollable dice) {
    this.dice = dice;
    this.turnCount = 0;
  }

  public boolean nextTurn(){
    int result = dice.roll();
    this.turnCount++;
    return result > 2;
  }
}