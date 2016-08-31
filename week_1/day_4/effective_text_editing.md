# Effective Text Editing

### Objectives
* Learn how to use Sublime more effectively
* Learn some shortcuts

### duration

45 mins

====================

As a developer you are going to spend a large portion of your time infront of a computer typing code and there's no escaping it. Given that computer programs are essentially just text files written in a special syntax i.e. a programming language you will want to make friends with your editor of choice.


## IDEs vs Text Editors

In some languages, you really have no choice but to use an IDE, or Integrated Development Environment. This is an all-singing, all-dancing, program that provides everything you need to 

* create 
* edit
* test 
* and deploy a software project 

All in one place. They are normally fairly large, expensive pieces of software as a result.

Popular examples of IDEs are [Visual Studio](https://www.visualstudio.com/), [Eclipse](https://eclipse.org/), [RubyMine](https://www.jetbrains.com/ruby/).

The other option is Text Editors designed for programming (like Sublime). These are much more limited in their scope, focussing on the job of helping your write good code but not as full featured. Because of this, you must also be comfortable manually performing the tasks that an IDE might abstract for you (e.g. like running tests).

However, the benefit is that Text Editors super light and fast when you want to get things done, or you're working on something small. even to make a tiny 1 page web app in Visual Studio takes about 10 minutes while you wait on it spinning up.

Some programming languages are rarely used outside of an IDE (e.g. C#). Infact if you wrote C# without Visual Studio you would be in for a world of hurt and the other developers would think you had lost your mind. 

For Ruby and Ruby on Rails it is very common to just use a text editor, although there are IDEs that support Rails. Either way, it is better to learn how to code using just a text editor and command line as this way you learn all the fundamental concepts that a 'magical' IDE can hide from you.

Some developers prefer IDEs, some prefer Text Editors. Sometimes a company might ask you to use their tool of choice, sometimes they might let you use whatever your want to.

## Efficiency

An important part of this coupling to our editor of choice is making not only friends, but best friends with it. Once you have learned the basics, move onto more advanced research about customisation and shortcuts.

It may seem trivial but it can make a huge impact to your productivity as a developer.

[i] replace this with your own example. 

As an example, my team lead used to provide top level estimates for projects. He never used any shortcuts, customisations or anything. He basically used Visual Studio like Notepad... which is kind of like using a Ferrari to go to down to Aldi and do the shopping.

I would get the work to do and complete it in a quarter of the time, because I was so much more efficient with my shortcuts. I could then use that time to learn new techniques, refactor my code and try stuff I wouldn't have had time to do otherwise. The faster you can do stuff, the faster you can get on to trying fun stuff.

## Sublime Text

Sublime Text is:

* multi-platform (OS X, Windows, Linux)
* popular (widely used for web development)
* free to try (though you will be nagged to purchase it)
* extensible (we can add functionality via plugins)

It also comes with a lot of really cool shortcuts we can use.

## Task

Get the students to go off and investgate interesting keyboard shortcuts for sublime.


### Find / find and replace

If you press `Cmd + f`, a text input should appear at the bottom of the window, giving you the option of finding text in the current document.

` Cmd + g` brings you to the next occurrence of the word you're searching for.

`Cmd + shift + g` does the same, but brings you to the previous occurrence.

`Cmd + shift + f` brings you to the search and replace menu.

If you press `Cmd + alt + f`, the window at the bottom should appear with 3 inputs: one for the word to find, one for the path, one for the replace value. If you type `<project>` inside the "path" text input, the search will only be executed within the scope of the current project.


### Cursor tricks

Put the cursor before the first character, press "Alt" and drag the cursor at the end the paragraph -> will allow you to enter text before all of the selected lines

Cmd + cursor click -> will set multiple blinking cursors on your file, allowing you to edit multiple elements at once. 

There are several other ways to use your cursor with combinations of "Alt", "Cmd" and "Shift", allowing you to become more productive as you go. 

See [gist.github.com/lucasfais/1207002](https://gist.github.com/lucasfais/1207002) for more examples. Try out a few! 


### Shortcuts

In terminal: 

`subl file1` will open file 1 in Sublime.

`subl .` will open current directory in Sublime. 

**In Sublime:**

Keypress          |  Action
------------------|--------- 
cmd + s           |  save changes in current file - DO IT OFTEN!!!
cmd + q           |  close Sublime
cmd + w           |  close one file at a time
cmd + alt + arrow |  switch between files
cmd + <number>    |  also switch between specific files
cmd + f           |  search in you current file
cmd + shift + f   |  search the entire project
cmd + d           |  go to next searched word in file
ctrl + cmd + g    |  selects all searched words in your file.
cmd + shift + p   |  take us to a command palette where we will be given menu options without leaving our keyboard.
cmd + p           |  open the file finder
cmd + p :NUMBER   |  put the cursor at line number NUMBER
cmd + ,           |  open the preferences
cmd + backspace   |  remove the line before your cursor
cmd + right/left  |  moves your cursor to the end/beginning of the line

Also: Don't forget we mapped `cmd + shift + r` to be "reindent".


### Settings and themes

`cmd + ,` allows you to access the sublime's user preferences.

It opens this file as a JSON object (we will learn all about JSON in the next few weeks). 
It presents the settings as a series of keys and values - you can add keys/values, and/or modify the existing values to fit your personal preferences.

You can see all of the choices of configuration by going to `Preferences: settings - default`. It's best not to edit the defaults; rather, copy keys into your user settings and set their value there.

We can change the colour scheme sublime uses by going to "sublime text 2/preferences/color scheme" and selecting one ("dawn" is a good recommendation). When you select a scheme it changes all the syntax highlighting colours.



## Extras

[5 things you didn't know sublime text 2 could do](http://www.creativebloq.com/design/5-things-you-didnt-know-sublime-text-2-could-do-1132849)

[Essential sublime text 2 plugins and extensions](http://net.tutsplus.com/tutorials/tools-and-tips/essential-sublime-text-2-plugins-and-extensions/)

[Sublime Text Useful Shortcuts](https://gist.github.com/lucasfais/1207002)

