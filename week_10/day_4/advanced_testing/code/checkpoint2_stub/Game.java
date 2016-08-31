public class Game {
  Rollable dice;

  public Game(Rollable dice) {
    this.dice = dice;
  }

  public boolean nextTurn(){
    int result = dice.roll();
    return result > 2;
  }
}