import java.util.*;

public class FakeDice implements Rollable {

  int numberOfSides;

  public FakeDice(int numberOfSides) {
    this.numberOfSides = numberOfSides;
  }

  public int roll(){
    return 3;
  }
}