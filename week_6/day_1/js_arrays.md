#JS Arrays

##Learning Objectives
- Know where to find MDN Array documents
- Create an Array
- Add/Delete/Access elements from Array


# Arrays
[docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

Arrays allow us to store an ordered collection.
[i]: Lockers

Let's make a little file to play in.

```
subl app.js
```

##Creating Arrays
We can create arrays using the square bracket notation

```
#app.js
var guitars = ["fender","gibson","gretsch"];
console.log("guitars", guitars)
```
We can create Arrays in two ways. Firstly with square brackets

```
var drums = [];
```

We can also create arrays using the constructor(more on this later)

```
var drums = new Array();
```

We can add items to the array using the push method.

```
drums.push("gretsch");
drums.push("yamaha");
console.log("drums", drums);
```

##Accessing Arrays

We can access elements from the array using the index.

```
  guitars[0]//fender
  drums[0]//gretsch
  drums[1]//yamaha
```

Trying to fetch something that isn't there will return undefined

```
  guitars[100]//undefined
```


We can also set elements directly using the index

```

  drums[1] = "zildijan";
  drums[10] = "boom"; #what will happen here?
  console.log(drums);
```

Arrays have helpful methods available, such as length

```
  drums.length;
```

##Task
[docs](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)
Find a way to remove the first element of an array.
Find how to remove the last element of an array 


###Solution
We remove items using splice(!). It returns an array containing the deleted items.
```
drums.splice(0,1);
```
If we want to delete items from the end of the array we can just use pop, which returns the deleted item.

```
drums.pop();
```
[i:] Get the students to go and find out about other array methods and play with them for 10 minutes.


slice
splice
shift
unshift
filter







