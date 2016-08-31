# Creating a Sub-class with Unit Tests

##Learning Objectives

* Create a java subclass in Android Studio
* Create simple tests for this class and run them

##Unit Testing

As we've been using TDD throughout the course, let's create some tests in our App. In Android Studio we can create Java classes just like we did last week and create unit tests for them.

##Create a sub class

We want to create as sub-class of our ```Answers``` abstract class. This class is going to use a simple list of strings to set up our answers for our eight-ball app so lets call it ```AnswersFromSimpleStrings```

```
java > example.codeclan.com.eightball
Right click > new class "AnswersFromSimpleStrings"
```

This will give us the following:
```
//AnswersFromSimpleStrings.java

    public class AnswersFromSimpleStrings  {
}
```

Any ideas as to what's missing? We want this to be a sub-class of the ```Answers``` class so we need to add ```extends Answers``` i.e.:

```
//AnswersFromSimpleStrings.java

    public class AnswersFromSimpleStrings extends Answers {
}
```

NOTE that Android Studio is now giving us an error. This is because ```Answers``` implements the ```Answerable``` interface, which defines the ```setupAnswer``` and ```getAnswer``` methods. The ```Answer``` superclass implements the ```getAnswer``` method, but leaves the implementation of ```setupAnswers``` to its's children, so we are getting this error because our new ```AnswersFromSimpleStrings``` class has still to implement ```setupAnswers```

###Add Constructors

Add a default constructor, which basically calls the one from the superclass:
```
//AnswersFromSimpleStrings.java

public class AnswersFromSimpleStrings extends Answers {
    public AnswersFromSimpleStrings() {
            super();
    }     
}
```

Add a second constructor, which takes in an ArrayList of strings and sets ```mAnswers`` to this list:

```
//AnswersFromSimpleStrings.java

public class AnswersFromSimpleStrings extends Answers {
    public AnswersFromSimpleStrings() {
        super();
    }

    public AnswersFromSimpleStrings(ArrayList<String> answers) {
        super(answers);
    }     
}
```

Finally, we need to implement the ```setupAnswers``` method as required by the interface:

```
//AnswersFromSimpleStrings.java

    @Override
    public void setupAnswers() {

    }
```

We'll leave it empty for now. We just want to get rid of the error so that our code will compile.

##Creating Unit Tests

Let's now write the test. We want to write a unit test for our model, not a test for any of the android specific functionality so we have to change the view of the project.

```
Build variants (left hand tab) -> unit tests
```

So, first of all, we need to add a new class to run the tests.

```
Right click test package > new class > AnswersFromSimpleStringsTest
```

This gives us an empty class. In order to be able to run tests we need to add the following two imports:

```
import org.junit.Test;
import static org.junit.Assert.*;
```

So our class will look like: 

```
//AnswersFromSimpleStringsTest.java

import org.junit.Test;
import static org.junit.Assert.*;

public class AnswersFromSimpleStringsTest {
}
```

Now we need to add a test. Because ```AnswersFromSimpleStrings``` inherits from ```Answers``` we can test the methods implemented by the superclass. For example, let's write a test to test the ```getAnswers``` method defined by ```Answers```:

```
//AnswersFromSimpleStringsTest.java

public class AnswersFromSimpleStringsTest {
    @Test
    public void getAnswersTest()
    {
        Answers answers = new AnswersFromSimpleStrings();
        assertNotNull(answers.getAnswers());
    }
}
```

Right click on AnswersFromSimpleStringsTest and it will allow us to run it. 

###Task
Go and write tests for the rest of the methods in the ```Answers``` class:

* getLength()
* getAnswerAtIndex()
* add()
* getAnswer() [Hint: you might want to print out the answer returned]

Possible Solution: 

Our test class could look something like:

```
//AnswersFromSimpleStringsTest.java

public class AnswersFromSimpleStringsTest {

    ArrayList<String> testAnswers;
        
    @Before
    public void before() {
        testAnswers = new ArrayList<String>();
        testAnswers.add("Yes!");
        testAnswers.add("That would be an ecumenical matter!");
    }


    @Test
    public void getAnswersTest() {
        Answers answers = new AnswersFromSimpleStrings();
        assertNotNull(answers.getAnswers());
    }

    @Test
    public void createAnswersWithListTest()
    {
        AnswersFromSimpleStrings answers = new AnswersFromSimpleStritestAnswers);
        assertEquals(2, answers.getLength());
    }

    @Test
    public void getAnswerAtIndexTest()
    {
        AnswersFromSimpleStrings answers = new AnswersFromSimpleStritestAnswers);
        String result = answers.getAnswerAtIndex(
        assertEquals("That would be an ecumenical matter!", result);
    
    @Test
    public void getAnswerTest() {
        AnswersFromSimpleStrings answers = new AnswersFromSimpleStritestAnswer
        String answer = answers.getAnswer();
        System.out.println("The answer is... " + answer);
        assertNotNull(answer);
    }
    
    @Test
    public void addTest() {
        AnswersFromSimpleStrings answers = new AnswersFromSimpleStrings();
        int originalNumberOfAnswers = answers.getLength();
        answers.add("Yes");

        assertEquals(originalNumberOfAnswers + 1, answers.getLength());
    }

}

```

###Task (10-15 minutes)

* Write a test for the ```setupAnswers``` method
* Complete the implementation of the ```setupAnswers``` method, making sure all the tests pass.

(Hint - look at what we did yesterday)

####Possible Solution

First of all, let's add a simple array of strings, containing only two answers (can you guess where they come from): 

```
//AnswersFromSimpleStrings.java

    @Override
    public void setupAnswers() {
        String[] answers = {
                "Yes!",
                "That would be an ecumenical matter!"
        };
    }
```

Now we need to add these answers to the ArrayList ```mAnswers``` in our class (remember that it is a member of the superclass). We can do this by looping through the array and calling the ```add``` method we declared in the ```Answer``` class i.e.:

```
//AnswersFromSimpleStrings.java

    @Override
    public void setupAnswers() {
    
        String[] answers = {
                "Yes!",
                "That would be an ecumenical matter!"
        };
    
        for(String answer : answers) {
            add(answer);
        }
    }
```


So our subclass should look like this:
```
//AnswersFromSimpleStrings.java

public class AnswersFromSimpleStrings extends Answers {

    public AnswersFromSimpleStrings() {
        super();
    }

    public AnswersFromSimpleStrings(ArrayList<String> answers) {
        super(answers);
    }

    @Override
    public void setupAnswers() {

        String[] answers = {
                "Yes!",
                "That would be an ecumenical matter!"
        };

        for(String answer : answers) {
            add(answer);
        }
    }
}
```


##Using our sub-class in our App

So now that we've got a class for our answers, we obviously want to use it in our app. So what we want to do is replace the code where we generate the answers with  

First of all, we need to have an instance of our class in our ```MainActivity``` class. So we need to declare a member variable for our class in MainActivity.java.

But which class should it be? Should we use ```Answers```  or ```SimpleAnswersFromStrings```? 

We can actually use either. It might be more sense to use ```SimpleAnswersFromStrings``` but we might want to change the way we get the answers so let's use the super-class i.e. ```Answers```, as we may ([i] and will ) want to use a different subclass.

So let's declare a member variable in MainActivity for the instance of our ```Answers``` sublclass. As it's a class member, we'll follow the Android naming convention and call it ```mAnswers```:

```
//MainActivity.java

public class MainActivity extends AppCompatActivity {
    ...
    Answers mAnswers;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        ...
    }
    ...
}

```

So now we need to initialise this. Now you're probably thinking "how can we create an instance of an abstract class". But we are actually going to create an instance of a subclass of ```Answers```, in this case ```AnswersFromSimpleStrings```. So we create an instance of the sub-class by calling its constructor, and assigning that to ```mAnswers```. 

So we do this in our ```onCreate``` method:

```
//MainActivity.java

    mAnswers = new AnswersFromSimpleStrings();
```

So now that we have an instance of our class, we need to get an answer from that class. So in our ```onClick``` method, we replace the code we previously had to get a random answer, with at call to ```mAnswers.getAnswer()``` :

```
//MainActivity.java
    mShakeButton.setOnClickListener(new View.OnClickListener() {
        @Override
        public void onClick(View view) {
            ...
                                                        _
            //String[] answers = {"Yes!", "No!"};        |
            //Random rand = new Random();                |<- OLD CODE
            //int index = rand.nextInt(answers.length);  | 
            //String answer = answers[index];           _|

            String answer = mAnswers.getAnswer(); <- NEW CODE
            ...
        }
    }

```

Run the app and see what happens. We should now be getting an answer from the list of answers in our ```AnswersFromSimpleStrings``` class.


##Recap

So in this lesson we've learned how to :

* create a Java sub-class in Android Studio
* create and run unit tests on that class
