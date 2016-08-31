# Your First Android App

## Learning Objectives

* Create a new project in Android Studio
* Create a simple activity in Android Studio
* Add a textView control to an activity
* Set up the emulator for a device in Android Studio
* Run an Android app in the emulator
* Debug an app using breakpoints and logging

## Your first Android App
We've seen Java last week and been introduced to the world of statically typed languages. We're going to continue our journey using a slightly different platform - Android. Unlike MacOS or Windows, Android is an OS which specifically targets mobile devices. Luckily, it uses Java which we already know but we have to get to grips with how we interact with a mobile device development platform.

One thing about Android is that it has excellent documentation. A good place to look for things is the [Android Developer site](http://developer.android.com/develop/index.html) but there's LOADS of stuff out there to help.

```
// setup 

launchpad > android studio

Start a new android project

// application settings 

Application name: HelloSandroid
Company Domain: com.codeclan.example

Select the sdk version version 16 (Jelly Bean)
```

Note: there are many many sdk version of android, since it's always changing and improving. Different devices will have different versions - you've probably seen this when you have tried to install an app from the app store or google play and it says your device is not supported. In our case, we are going to target a version of Android which isn't the newest but can be run on all devices with that version of Android and later.

```
Click next

//Form factors

Don't change

// Activity

No activity > next

Activity name: Keep it as main activity

Click finish

```
## Project Structure

### Manifests

This file contains all the infromation that the OS needs to run the application. We will revisit it later and see why it is so important.

### Java

This is where the "package" goes that we just created.  All of our code that we write in Java lives here.

There is also a Tests package where we can put our lovely unit tests.

### Gradle Scripts

Gradle is a task runner for Java and Android, we don't need to worry too much about this for now. We'll come back to it later in the week.

[i]: Gradle is a build tool which takes your Java code and XML layouts, and then uses the latest Android build tools to create the app package file, known as an APK file. You can customize your configurations to have development or production versions of the app that behave differently, or add dependencies for third-party libraries. Taken from [here](https://www.raywenderlich.com/78574/android-tutorial-for-beginners-part-1)

### Res

This is where any "resources" that are not Java code will live. This includes: image files, audio files and most importantly XML files. We will use these XML files to scaffold our application and define things such as how things will be displayed on our device.

Drawable is where we will put images. "Launcher" icons (the icon on our phone) reside in the mipmap/ folder rather than the drawable/ folders. Values is where we can store text which can be accessed across our application but we will return to this in more depth later.

## A world without HTML

So far we have been building apps where we use HTML to structure how elements are displayed on the page. We can then use CSS to style these elements and make them look nice.

However...

We are now in a world where we have no HTML. It lives in the browser. We are building a "native" app - this is an application which is tied to the OS and uses specific capabilities of the device. It's not like a browser which can run on many OS types.

We need a way to interact with our device and display things to users. The good news is, Android uses XML to achieve this in a very similar manner to how we use HTML in the browser.

## Activities and Intents

Android has the concept of "activities" and "intents". We will look more in depth at these concepts as we build our apps as you can see it in context.

Activities are basically an individual screen in your app which is responsible for drawing it's components, like buttons and text boxes.

Intents sit between both the OS and activites, giving the OS actions to do and giving back information to activities but also sit in between activities passing around information.

That's enough on this for now.

## Our First Layout

```
Right click on res
Select new > directory
Directory name: layout

Right click layout
New > Layout resource file
file name: activity_main
Keep LinearLayout
```
You can see that it's generated an XML file for us called activity_main.xml.  We can set the orientation (vertical or horizontal) for this particular view. Do the elements flow from left to right or up to down. Width and Height can be set but in our case we want to take up the full screen - ```match_parent``` wil make it the same as the parent which in this case is the actual screen itself.

### A problem

This is all well and good, but we need to give the program a starting point that it launches from. In the same way that we needed the static main method in our Java apps. 

[i]: in this example, Our Package is called 'example.codeclan.com.hellosandroid'

```
Right click Java > <Our Package>  > New > Java Class
Name: HelloSandroid
```

[i]: our package should be example.codeclan.com.hellosandroid

This has created an empty class for us. We need to inherit from a special class in Android that lets us run our program.

```
//HelloSandroid.java

public class HelloSandroid  {
}

```

We need to tell our app to use our freshly created layout. This has to be done when the app is loaded or "created". Android provides us with a "hook" we can use to talk to the application when it is loading and tell it some useful things we want it to do, like what layout to use. This is  very common pattern you will see in statically typed languages, where we can add custom functionality to code from a third party.

This "hook" is inside of a class called ```AppCompatActivity``` that Android provides - we don't need to worry too much about this but we need to inherit from this using our own class so we can use it.

[i]: We are actually creating a sublclass of the Android ```Activity``` class. ```AppCompatActivity``` is a subclass of Android's ```Activity``` class that provides compatibility support for older versions of Android

```
//HelloSandroid.java

public class Sandroid extends AppCompatActivity {
}

```

AppCompatActivity is currently red, we highlight the whole word, hit alt and enter and choose the option "import class". 

An info window will appear saying that we need to import a library file from Android. Click OK. 

This class provides the "hook" into the creation of the app using a method called "onCreate". We use method overriding to get access to this and give it our layout.

```
//HelloSandroid.java

public class HelloSandroid extends AppCompatActivity {

   @Override
   protected void onCreate(Bundle savedInstanceState) {

   }
}

```

Bundle is currently red, we highlight the whole word, hit alt and enter and choose the option "import class".

[i]: ```Bundle savedInstanceState``` is used to restore the state of the app if it had been running before then shut down.   

Our imports should look like this.

```
//HelloSandroid.java
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
```

We now need to call the onCreate method from the super class.

```
//HelloSandroid.java

public class HelloSandroid extends AppCompatActivity {

   @Override
   protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
   }
}

```

Lastly we need to set the content view to what's inside of our activity_main. We add this code inside the ```onCreate()``` function in ```HelloSandroid.java```  

```
//HelloSandroid.java

  setContentView(R.layout.activity_main);
```

### We need to talk about R...

R is an automaticallly generated class that gives us access to our resources.  In our case, we are looking in R.layout.activity_main - the R class has some code that knows to look this up in the res directory.

## Emulation

It would be good to see what our app looks like. This is an app for a mobile device and we are using a Mac... we know that Android specifically targets the mobile OS so how can we run it?

Luckily Android Studio provides us with an "emulator". These are actually really cool and fast now and make it easy for us to run our programs as if it was on a native mobile device.

```
Click on the green play button. 
```

We have no running device so we have to launch an emulator.

[i:] If you don't see the Android menu then try building the project first.

```
Tools > Android > AVD Manager
Create a virtual device
Select hardware -> Tablet -> Nexus 7

```
There are various api levels we can choose from. Let's go for the Api level 16 - we are running an x86 machine so we will go with that.

[i:] x86 is the processor for the Mac rather than for the device.  This is just the name of the Intel family of processors, other options might be AMD64 or Armabi etc. 

Select "Release Name: Marshmallow | API Level: 23 | ABI: x86_64 | Target: Android 6.0"
Click Download and install HAXM - you will need to enter the password for your laptop.
Hit next, then finish to return the the AVD setup now that you've installed HAXM.

```
Configuration

Leave this all as it is with portrait orientation
```
We should now see this in our list of devices.

```
Click the green play button on the top. 

```

We can now choose the device we just created from the "launch emulator" dropdown.

```
Hit OK, this will launch AVD... 
```

If it doesn't launch, you may need to restart Android studio before you can run the AVD.

This takes just as long as a device takes to boot up!

When this has finished loading, it will look like a tablet on our screen. It next has to load our program onto the device.

If we look in the log we should see this happen.

```
Click on the application button (3 dotted lines)

```
We should expect to see a 'Hello Sandroid!' app.

But!!! It's not there!!!!! What has happened?

We have left out one VERY important step...

## Manifest

In the ```app/manifests``` directory there is a file called AndroidManifest.xml. This is a VERY important file. It gives the app all the information it needs about resources that it needs to use when it is running. 

Every "activity" we want to include needs to be listed here otherwise the app can't find it when it's running. Remember we mentioned at the start that this file was important?

We need to add some xml here to include our "activity". 

```
//manifest.xml
<activity>
</activity>
```
There is a whole bunch of attributes we need to add to this.

```
//manifest.xml
<activity
           android:name="example.codeclan.com.hellosandroid.HelloSandroid">
```

android:name is a reference to the class that our program is going to execute from (we added it earlier remember). Its quite laborious to type whole package so we can simply type ```.HelloSandroid```


```
//manifest.xml
  <activity
           android:name="example.codeclan.com.hellosandroid.HelloSandroid"
           android:label="Hello Sandroid!">
```

This label will display on the top bar of our app (more on this later).

The next thing we need is called an "intent filter". We need to use this to tell the OS there is something that we want done.

These have an "action" and a "category". The action tells it what to do and the category describes where when or how we want to use an activity. In our case, we want to use the "LAUNCHER" category to show the app in the list of apps.

```
//manifest.xml
      <activity
           android:name="example.codeclan.com.hellosandroid.HelloSandroid"
           android:label="Hello Sandroid!">
           <intent-filter>
              <category android:name="android.intent.category.LAUNCHER"/>
           </intent-filter>
       </activity>
```
Lastly, let's add the action. Android provides a "MAIN" action which is the entry point to our app that actually runs it.

```
//manifest.xml
<activity
           android:name="example.codeclan.com.hellosandroid.HelloSandroid"
           android:label="Hello Sandroid!">
           <intent-filter>
            <action android:name="android.intent.action.MAIN"/>
            <category android:name="android.intent.category.LAUNCHER"/>
       	 </intent-filter>
       </activity>
```

## Let's run it!!!

```
Click green play button
Click applications icon (3 dotted lines)
Click the wee android that says Hello Sandroid!
```

## Strings and Stuff

What if we want to change the name of the app? It's currently hard coded in our manifest file. It's feasible we might want to use the name of the app in other places - like on the menu, footer. 

Luckily, we have a place to put any "resources" that we might want to use. 

```
res > values > strings.xml
```

We can add a new entry to here which we can access all across our application, using the handy R class we encountered before.

There's already a sample entry in here called "app_name". This name is how we are going to access it (just like we did with ids in HTML and JS) and the text between the tags is what will be returned.

[Task:] Update this text to be something fun (and short!)

Return to the manifest.xml and where we had ```android:label="Hello Sandroid!"``` let's make it dynamic. We need to use a special syntax to access entries in our strings.xml.

```
"@string/app_name"
```

@string shows that it's part of the "strings" resource. Even though the filename is plural, we access it using the singular just like with DB tables. Then we put a slash and the "name" we gave to the xml tag.

## Components

In HTML, we could build up our page using divs, inputs, spans, p tags etc. In Android, we have a set of container can use in a similar fashion to build up our screens.

For example.

* TextView displays a piece of text
* Button is a button...
* Checkbox is a checkbox...

Check out the docs to see all the options.

You can see they all have fairly sensible names and provide similar functionality like we have seen in HTML. We just have to get used to how we implement this in Android.

Let's add a textview to our main view (activity_main.xml).

Just like in html, we need to use tags to create components.

```
//activity_main.xml
<TextView />

```
As a bare minimum, we need to give it attributes for height, width and the text it contains. There will be many others we can use, check the docs!

```
//activity_main.xml
  <TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Hello Sandroid :-)" />
```

```wrap_content``` will make the component as big as it is needed to be to contain it's contents.

[Task:] Go and add a new resources string that will set the text dynamically so it can be reused in other places (like with the title).

[Task:] Add another text view with dynamic content. Try setting the orientation (on the parent layout) to horizontal and see what happens.

```
//res > values > strings.xml
<string name="hello_val">Hello Val</string>

//activity_main.xml
<TextView
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="@string/hello_val" />
```

## Debugging

Obviously if things go wrong then we want to debug our code. In Android Studio two main ways of tracking how things are going when our program is running are by using breakpoints, and using logging.

###Breakpoints

Adding breakpoints in Android Studio is pretty easy ([i]: Aye right!). All you need to do is to click on the grey bar to the left of the code, next to the line of code you wish to place the breakpoint on.

To get the code to stop at the breakpoint when running, rather than click on the 'Run' button, you click on the 'Debug' button (it looks like a wee bug on the top toolbar) . The code will run as before, but will stop at the breakpoint.

###Logging

Another way to track things is to use logging. Logging is useful especially if you want to run your App without stopping at breakpoints. Logging allows us to display useful messages in the IDE console while running our App in the emulator. Let's add a logging message which tells us whenever the ```onCreate()``` method is called in ```HelloSandroid.java```.

In HelloSandroid.java, add the following line to the onCreate() method:

```
Log.d("HelloSandroid:", "onCreateCalled");
```
[i:] the 'd' stands for 'debug'. There are many others e.g. 'e' for error.

Now rerun the app and look in the 'Logcat' window in the bottom of the IDE. Among all the logging messages you should see the following message:

```
example.codeclan.com.hellosandroid D/HelloSandroid:: onCreateCalled
```

You can see that there are lots of other logging messages displayed. Wouldn't it be great if we could only show the messages which we have created? 

We can do this by applying filters to the logging. Above the window showing the logging messages you should see a textbox window with a magnifying glass inside it. Enter 'HelloSandroid' in this window. What do you see?

There should now only one be one message displayed - the logging message you created.

There are other options which can be used to filter the logging. Go and read the documentation to find out more.

##Recap

So what have we learned in this lesson:

* how to create a new project in Android Studio.
* how to a simple activity in Android Studio
* how to add a textView control to an activity
* how to set up the emulator for a device in Android Studio
* how to run an Android app in the emulator
* how to do simple debugging using breakpoints and logging.






