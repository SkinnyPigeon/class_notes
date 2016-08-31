public abstract class Bear {

  public abstract void gatherFood();

  public void roar(){
    System.out.println("roar!");
  }

  public void typicalDay(){
    wakeUp();
    gatherFood();
    eat();
    sleep();
  }

  public void wakeUp(){
    System.out.println("Waking up");
  }

  public void eat(){
    System.out.println("Eating");
  }

  public void sleep(){
    System.out.println("Going to sleep");
  }
  
}