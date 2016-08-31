package card_game;

import card_game.*;
import java.util.*;

public class WinChecker {

  private Player player1;
  private Player player2;
  private ArrayList<Player> winners = new ArrayList<Player>();

  public void setPlayers(Player player1, Player player2){
    this.player1 = player1;
    this.player2 = player2;
  }

  public Player checkForWin(){

    checkForPrial(player1);
    checkForPrial(player2);

    if (winners.size() > 0) {
      if (winners.size() == 1) {
        return winners.get(0);
      }
      else {
        // If both players have a Prial, the player whose Prial is of the highest number wins. This version has Ace as low. Could add in to have 3 as the top number which is a special rule for 3 card brag. 
        if (//player 1 has a higher number
          )
        {
          return player1;
        }
        return player2;
      }
    }

    return null;
  }

  public boolean checkForPrial(Player player){
    Card[] hand = player.getHand();

    if (//all 3 cards are the same
      )
    {
      winners.add(player);
      return true;
    }
    return false;
  }



}