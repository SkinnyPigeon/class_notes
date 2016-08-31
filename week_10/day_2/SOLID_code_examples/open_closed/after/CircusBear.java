public class CircusBear extends Bear{

  private boolean isDancing;

  public String dance(){
    this.isDancing = true;
    return "This is my dancing, bears aren't built for this.";
  }

  // non-essential Annotation to indicate a method which overrides its superclass
  @Override
  public void eat(Edible food){
    if (this.isDancing){
      this.isDancing = false;
    }
    super.eat(food);
  }

}