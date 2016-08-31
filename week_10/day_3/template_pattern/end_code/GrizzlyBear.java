public class GrizzlyBear extends Bear {
  
  public void gatherFood(){
    System.out.println("Off to farmfoods");
  }

  @Override
  public void wakeUp(){
    System.out.println("Slept in");
  }
  
}