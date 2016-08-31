# Basic Arrays

### Learning Objectives

- Create a basic array
- Use two kinds of for loop
- Understand null

## Intro

In this lesson we are going to have a look at the most basic Java collection - the Array. We've encountered them in other languages and now we are going to see how they work in Java. They are exactly the same in principle - a container to hold a set of items.

In Ruby and Javascript, we could put a mixture of things into an array:

```
#irb
myArray = [1,2,3,"banana", true];
```
In Java world, we can't do this so easily. We're going to have a look at why this is the case in this lesson.

[i:] Give out starter code

If you have a look at the code, we have one class - Bear. This can have a name, and we have a little test to confirm this works. 

Notice that we have a "Before" method, which is exactly the same as setup() and beforeEach() that we have seen in Ruby and Javascript.

## Array Initialization

At some point, our little bear here is going to get hungry. He quite likes to eat Salmon, so let's make a little salmon class.

```
#terminal
touch Salmon.java

#Salmon.java
public class Salmon {

}
```

Cool, we've got a little salmon. Now, our bear is going to want to eat a salmon, and to do this he's going to need to be able to get food into his tummy.

```
#Bear.java
public class Bear {
  private String name;
  private Salmon[] belly; //NEW

  //same as before
}

```

We need to declare the type of things that go into the array, followed by square brackets then the name of the array variable. This means that Salmon and ONLY Salmon can be kept in this array.

We've declared the variable, but now we need to initialize it in the constructor.

```
#Bear.java
  public Bear(String name){
    this.name = name;
    this.belly = new Salmon[5]; //UPDATED
  }
```

We need to give the array a size and it can only be of this length. If we try to add more than five items, we will get an error. 

The array is not empty - it is already populated with 5 null entries. This will become important later.

## Counting the items

We want to see how much food is in the bears belly - initially it should be zero.

Let's write the test

```
#BearTest.java
  @Test
  public void bellyStartsEmpty(){
    assertEquals(0, bear.foodCount());
  }
```

Bearing in mind (Bearing!!! Get it?!) that our array is not empty - it's full of 5 null values, how can we count how many items are in the bear's belly.

[i:] Let the students have a think about it for 2 minutes

For loops over collections look a little strange in Java.

```
#Bear.java
  public int foodCount(){
    for(Salmon salmon : belly){

    }
  }
```
We're going to need some kind of count so let's add that.

```
#Bear.java
  public int foodCount(){
    int count = 0;
    for(Salmon salmon : belly){

    }
    return count;
  }
```
Lastly we only want to count those entries which are not null.

```
#Bear.java
  public int foodCount(){
    int count = 0;
    for(Salmon salmon : belly){
      if(salmon != null){
        count++;
      }
    }
    return count;
  }
```

Cool! Theoretically we should have a passing test.

## Eating a salmon

Let's try to get our bear to eat a salmon. First, let's add a test salmon to our unit tests.

```
#BearTest.java
import static org.junit.Assert.assertEquals;
import org.junit.*;

public class BearTest {
  Bear bear;
  Salmon salmon; //NEW

  @Before
  public void before(){
    bear = new Bear("Baloo");
    salmon = new Salmon(); //NEW
  }
  //same as before
 }
```
Cool, now we can use this salmon in our tests.

```
#BearTest.java
  @Test
  public void canEatSalmon(){
    bear.eat(salmon);
    assertEquals(1, bear.foodCount());
  }
```

Let's add the eat() method.

```
#Bear.java
public class Bear {
  //same as before
  
  public void eat(Salmon salmon){
     
  }
}
```

Now, there's is some bad news. There are no methods on a primtive array to help us out. We can't add(), pop(), push(), nothing. The only way to add an item is to set it explicitly by using an index position.

```
#Bear.java
  public void eat(Salmon salmon){
    belly[0] = salmon;
  }
```
What would happen if we left it like this? Yep, we'd only ever have one Salmon in our belly and the rest of the items would be null. How are we going to fix this?

[i:] Let them think about it for a moment

One possible solution is to keep a counter everytime we add a Salmon, so that we know where the next Salmon should be added.

```
#Bear.java
 public void eat(Salmon salmon){
    int foodCount = foodCount();
    belly[foodCount] = salmon;
  }
```

## Index out of bounds

We do have a little problem, however. What happens if we try to add 6 fish to the bear's belly? Let's write a little for loop that adds a salmon 10 times to our bear's belly.

```
#BearTest.java
  @Test
  public void canNotEatSalmonWhenBellyFull(){
    for(int i = 0; i<10; i++){
      bear.eat(salmon);
    }
    assertEquals(bear.foodCount(), 5);
  }
```

A dirty great big exception! Our Array can only have 5 items and no more. When we try to add another one, the compiler throws a hissy fit. 

First, we need a new unit test. We'll comment out the canNotEat etc one for now.

```
#BearTest

// @Test
// public void canNotEatSalmonWhenBellyFull(){
//   for(int i = 0; i<10; i++){
//     bear.eat(salmon);
//   }
//   assertEquals(bear.foodCount(), 5);
// }

@Test //NEW
public void bellyIsFull(){
  for(int i = 0; i<5; i++){
    bear.eat(salmon);
  }
  assertEquals(bear.bellyFull(), true);
}
```

Let's add a guard for when the bear's belly is full.

```
#Bear.java
  public boolean bellyFull(){
    return foodCount() >= belly.length;
  }
  
   public void eat(Salmon salmon){
    if(bellyFull()) return; //UPDATED
    belly[foodCounter] = salmon;
    foodCounter++;
  }
```

Great now we can comment back in our test and it should be passing.

## Resetting the array

Lastly, let's add a way for our Bear to go to sleep and let his belly settle.

```
#BearTest.java
  @Test
  public void shouldEmptyBellyAfterSleeping(){
    bear.eat(salmon);
    bear.sleep();
    assertEquals(bear.foodCount(), 0);
  }
```
How do you think we can do this?

[i:] Give the students 2 mins to think it out

```
#Bear.java
  public void sleep(){
    for(int i = 0; i < belly.length; i++){
      belly[i] = null;
    }
  }

```
Well done, you have mastered primitive arrays!
