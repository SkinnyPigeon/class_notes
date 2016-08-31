#Data Structures

##Learning Objectives
  - Describe an Array
  - Describe a Linked List
  - Describe a Hash

##Introduction
We have been storing data in memory.  What collections have we been using?  Arrays, Hashes.
We use these without really thinking about how they are stored in memory and the advantages and disadvantages of them. Today we are going to look into this and a new data structure Linked Lists.

Lets' draw our RAM - big circle

##Hash- HashTable HashMap
Hash is a collection of key value pairs. Tends to be unordered.
Inserting, deleting and retrieving elements is quick.

##Ordered Data
Often we have data for which the order is important.
## Arrays
Sequentially stored in memory. Pre determined size.  A section of memory is set aside for it.
Indexing - getting an element by it's index position is very fast as we can directly access the location. O(1)
Length - is pre-determined so also very fast. O(1)
Inserting - is not possible in a standard array.  But we do this in Ruby right?  And array in ruby is actually a dynamic array. Inserting into a dynamic array can be slow.  If we have data that is changing in size regularly there are structures that are more suited.O(n)

## Linked List
Linked List is an ordered dynamic data structure. However it works in a very different way to an Array.  The element of the list are scattered around memory. Each list element consists of it's value and the reference to the next element in the list.

Indexing - requires traversing the list beginning at the start and making it's way to the element. Slower than an array.O(n)
Length - requires traversing the whole list until it comes to an element with not referencing anything. O(n)
Inserting - this is where a linked list is strong.  To insert an element it can just put it at the start and reference the first element. Deleting is also easy, as you can just change the reference of any item.O(1)

Linked Lists also require more memory than arrays as they need to also store locations.

##Overview

Linked Lists are a dynamic ordered data structure designed to change in size with insertion and deletion.  Finding particular values is slow as has to traverse the structure.

Arrays are a static data structure. Set size when created.  Elements are congruent in memory so accessing individual elements is fast.

Many languages have data structures which are a combination; ArrayList Java, and am Array in Ruby,  that provide the best of both worlds and allow us not have to think too much about it at this level. However, it is useful to know about the underlying structures however as when high performance is needed using the correct structure can have huge implications.
