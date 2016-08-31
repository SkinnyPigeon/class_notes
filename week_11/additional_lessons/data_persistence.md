#Data persistence

##Learning Objectives

* Learn about the different ways Android uses to persist data
* Persist data using SharedPreferences

##Data persistence

In Android there are different ways to save persistent data. The method that you choose depends on your specific needs, such as whether the data should be private to your application or accessible to other applications (and the user) and how much space your data requires.

The methods are:

* Shared Preferences - store private primitive data in key-value pairs.

* Internal Storage - store private data on the device memory.

* External Storage - store public data on the shared external storage e.g. SD card .

* SQLite Databases - store structured data in a private database.

* Network Connection - store data on the web with your own network server.

Which method do you think we shall use?

The method we are going to use is Shared preferences.

##Using Shared Preferences

Shared preferences use the ```SharedPreferences``` class. This class gives us a general framework that lets us save and retrieve persistent key-value pairs of primitive data types. We can use SharedPreferences to save any primitive data: booleans, floats, ints, longs, and strings. This data will persist across user sessions (even if you kill your app). 

So to show this we are going to use a very simple app. The first time you run this app, you will be asked to enter some text, which you will save. The next (and subsequent) time(s) you open the app, you will see the saved text.

[i]: refer to the starting point code handed out in class. Note that you are asked for text every time we run the app.

##Saving our saved text

First of all we need to set up a class so that we can save and get back stored preferences. We'll start off by creating a class, lets call it SavedTextPreferences. Android has a class called ```PreferenceManager``` which we use to get and set shared preferences, so, at the top of the file we need to import ```android.preference.PreferenceManager```

```
//SavedTextPreferences.java

import android.preference.PreferenceManager;

public class SavedTextPreferences {
    
}
```

In our class we now need to set a key for the key-value pair for our stored user name. We shall set it as a variable at the start of the class. We'll call this variable ```PREF_SAVEDTEXT``` and set its value to `savedText`

```
//SavedTextPreferences.java

import android.preference.PreferenceManager;

public class SavedTextPreferences {
    private static final String PREF_SAVEDTEXT = "savedText";
}
```

So we now need two methods in our class. Can anyone think what we would want each of these functions to do. 

Well we want a method to store our stuff, and a method to get our stuff back. So let's start by writing a method to store our stuff. Lets call it ```setStoredText```. This method needs to take in two parameters, our old mate, the Context, and the string containing the text we want to save.

```
//SavedTextPreferences.java

public class SavedTextPreferences {
    private static final String PREF_SAVEDTEXT = "savedText";

    public static void setStoredText(Context context, String text) {
        
    }
}
```

So to store our stuff we need first of all to get the default shared preferences for the context. We do this by calling the ```PreferenceManager.getDefaultSharedPreferences``` method, passing it our context

```
//SavedTextPreferences.java

    public static void setStoredText(Context context, String text) {

        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context); <== ADDED
    }
```

We then want to edit these shared preferences, so we call the ```edit``` method on what ```getDefaultSharedPreferences``` returns.

```
//SavedTextPreferences.java

    public static void setStoredText(Context context, String text) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
    
        SharedPreferences.Editor editor = sharedPreferences.edit(); <== ADDED
    }
```

We now want to put our key-value pair into the shared preferences. We do this by calling the ```putString``` method. This takes two arguments, the key which, in our case is ```PREF_SAVEDTEXT``` and the ```text```  string, which is the text string passed into the method.

```
//SavedTextPreferences.java

    public static void setStoredText(Context context, String text) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor editor = sharedPreferences.edit();
                        
        editor.putString(PREF_SAVEDTEXT, text); <== ADDED
    }
```

The next thing we need to do is ***VERY*** important. We need this all to be stored. Think back to Sinatra where we had to call the ```save``` method after making any changes. The method we call is called ```apply``` i.e.:

```
//SavedTextPreferences.java

    public static void setStoredText(Context context, String text) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor editor = sharedPreferences.edit();                        
        editor.putString(PREF_SAVEDTEXT, text); 
        editor.apply();
    }
```


This is sometimes chained into one line e.g.:

```
//SavedTextPreferences.java

    PreferenceManager.getDefaultSharedPreferences(context)
                            .edit()
                            .putString(PREF_USERNAME, text, )
                            .apply();
```

[i]:So the completed function should now look something like:

```
//SavedTextPreferences.java

    public static void setStoredText(Context context, String text) {
         SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
            
        SharedPreferences.Editor editor = sharedPreferences.edit();                        
        
        editor.putString(PREF_SAVEDTEXT, text); 
        editor.apply();

        /*
        ** Single line version **
        PreferenceManager.getDefaultSharedPreferences(context)
                            .edit()
                            .putString(PREF_SAVEDTEXT, text)
                            .apply();
        */
    }
```

So now that we've got our method to store our stuff we need a method to get it back. Let's create one and call it ```getStoredText```. This only takes in one parameter, the context, and returns a string, our data.

```
//SavedTextPreferences.java

    public static String getStoredText(Context context) {
    }
```

Like before, we need  to get the default shared preferences for the context


```
//SavedTextPreferences.java

    public static String getStoredText(Context context) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context); <== ADDED
    }
```

But rather than calling putString we call something else? Any ideas? Yes, we call ```getString```. Any ideas as to what we pass to ```getString```? Well we are looking up a key-value pair so it might be an idea to pass it the key, ```PREF_SAVEDTEXT``` along with null (don't know why?) and return the string we get from this

```
//SavedTextPreferences.java

    public static String getStoredText(Context context) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);
        
        return sharedPreferences.getString(PREF_SAVEDTEXT, null); <== ADDED

        /*
        ** single line version 
        return PreferenceManager.getDefaultSharedPreferences(context)
                .getString(PREF_SAVEDTEXT, null);
        */
    }
```

[i]: so now our complete class should look something like:

```
//SavedTextPreferences.java

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;

public class SavedTextPreferences {
    private static final String PREF_SAVEDTEXT = "savedText";

    public static void setStoredText(Context context, String text) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);

        SharedPreferences.Editor editor = sharedPreferences.edit();

        editor.putString(PREF_SAVEDTEXT, text);
        editor.apply();
    }

    public static String getStoredText(Context context) {
        SharedPreferences sharedPreferences = PreferenceManager.getDefaultSharedPreferences(context);

        return sharedPreferences.getString(PREF_SAVEDTEXT, null);
    }

}
```


##Storing/Getting our text

So now that we have our class to actually store and get strings from  SharedPreferences we need to think about how we store our text in the SharedPreferences, and how we get it back from the SharedPreferences. 

[i]: As said before we can only store simple types e.g. strings, ints, booleans. 

[i]: How might we store something more complex, like an ArrayList of objects? We could use JSON. We could convert our list into JSON i.e. a string, and store the JSON string in the shared preferences, and when we get the JSON string back from shared preferences we can convert it back to an ArrayList.

###Storing our text

So how do you think we would now use the code we have just written to store our string?  

We can call ```setStoredText``` and pass it the string we have entered in our ```EditText``` control.

```
    SavedTextPreferences.setStoredText(<CONTEXT>,<TEXT TO SAVE>);
```

So where would we do this? We could do it when we click the ```Save``` button i.e. in ```onClick```: 

```
//SavedTextPreferences.java

    mSaveButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String textToSave = mTextToSave.getText().toString();
                Log.d("PersistenceExample:", "Save Button Clicked!");
                Log.d("PersistenceExample:", "The text to save is: '" + textToSave + "'");
                mSaveButton.setVisibility(View.INVISIBLE);
                mTextToSave.setVisibility(View.INVISIBLE);
                mSavedText.setVisibility(View.VISIBLE);
                mSavedText.setText(textToSave);
                SavedTextPreferences.setStoredText(context,textToSave); <== ADDED
            }
        });
```

But we need to pass in a context to ```setStoredText```! Where do we get this from?

We can get a context to pass by calling ```getContext`` on the view object passed into the ```onClick``` method i.e. 

```
Context context = v.getContext();
```

We can insert this just before the call to ```setStoredText``` i.e.:

```
//MainActivity.java

    mSaveButton.setOnClickListener(new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            String textToSave = mTextToSave.getText().toString();
            Log.d("PersistenceExample:", "Save Button Clicked!");
            Log.d("PersistenceExample:", "The text to save is: '" + textToSave + "'");
            mSaveButton.setVisibility(View.INVISIBLE);
            mTextToSave.setVisibility(View.INVISIBLE);
            mSavedText.setVisibility(View.VISIBLE);
            mSavedText.setText(textToSave);
            Context context = v.getContext(); <== ADDED
            SavedTextPreferences.setStoredText(context,textToSave); 
        }
    });
```



##Getting the stored data back

So we've got a method to store the text string, now we need to do the opposite and get the favourites back from the shared preferences. So let's call our method ```getStoredText``` but where should it go? Well we want it to get our favourites as soon as the app opens so it would go in the ```MainActivity``` class.

So we're going to do almost exactly the opposite as when saving text i.e. we are going to 

* get the string storing our text from the shared preferences
* display the text on the page, hiding our EditText and Button controls.

So the first thing we need to do is get the string storing our text from the shared preferences. So how would we do this? 

We can do this by calling the ```getStoredText``` method in our ```SavedTextPreferences``` class, passing ```this``` as the context. 

The ```getStoredText``` method returns a string so we need to store this in a String variable. So let's declare a String in our ```onCreate```, calling it ```savedText``` and use this to store the string returned from calling ```getStoredText```:

```
//MainActivity.java

@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mTextToSave = (EditText)findViewById(R.id.text_to_save);
        mSaveButton = (Button)findViewById(R.id.save_button);
        mSavedText = (TextView)findViewById(R.id.saved_text);
        mSavedText.setVisibility(View.INVISIBLE);

        String savedText = SavedTextPreferences.getStoredText(this); <== ADDED
        ...
    }
```


So now we can start writing the rest of our code. 
The first thing we want to do is check if anything has been stored. We can do this by checking to make sure that the string is not empty and is not null:

```
//MainActivity.java

@Override
    protected void onCreate(Bundle savedInstanceState) {
        ...
        String savedText = SavedTextPreferences.getStoredText(this); 
                                                           __
        if (savedText != null && !savedText.isEmpty()) {     \
            /* do your stuff here */                          | <== ADDED
        }                                                  __/
        ...
    }
    
```

So what do we want to do in here if we have some saved text:

* hide the save button
* hide the text edit control
* make the text view control visible

We can do this by adding the following code

```
//MainActivity.java

    if (savedText != null && !savedText.isEmpty()) {
        mSaveButton.setVisibility(View.INVISIBLE);
        mTextToSave.setVisibility(View.INVISIBLE);
        mSavedText.setVisibility(View.VISIBLE);
        mSavedText.setText(savedText);
    }
```

```
//MainActivity.java

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        ...
        String savedText = SavedTextPreferences.getStoredText   
                                                           
        if (savedText != null && !savedText.isEmpty()) { __    
            mSaveButton.setVisibility(View.INVISIBLE);     \
            mTextToSave.setVisibility(View.INVISIBLE);      | <== ADDED
            mSavedText.setVisibility(View.VISIBLE);         |
            mSavedText.setText(savedText);               __/         
        }                                                  
        ...
    }
            
```


Let's now try and see if this works

* open up the app
* Enter some text and click the save button
* close the app
* reopen the app
* your text should still appear

##Task

Try closing the emulator and running the app again. Does your text still appear?
