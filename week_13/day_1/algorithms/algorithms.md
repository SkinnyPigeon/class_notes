#Algorithms

##Intro
An algorithm describes a way to solve a problem.  There are often many algorithms to solve a problem.  

##Searching

##Guess Who
Let's think about searching.  We can consider a game of Guess Who.

Algorithm One:
  Guessing name each time.

Algorithm Two:
  Halving each time by characteristic.

Which of these algorithms is 'better'?


##Time Complexity
We often want to analyse an algorithm. Often the most important factor of an algorithm is how long it will take to run. This is called the time complexity.  Let's analyse our solutions for Guess Who.  What we are interested in is how many steps it will take for the algorithm to complete.  How many questions we will need to ask.


###Best Case(not usually of interset)
What is the least number of steps the algorithm can take.
Name Guessing:
1
Characteristic:
1

###Worst case
What is the most number of steps the algorithm can take.

Name Guessing:
n

Characteristic:
Halving each time.  8 -> 4 -> 2 -> 1 (3 steps) 2^3=8 log(n)

###Average case
Given a number, how long on average will it take for the algorithm to find the position.

Name Guessing:
1/2(n)

Characteristic:
Halving each time.  8 -> 4 -> 2 -> 1 (3 steps) 2^3=8 log(n)



##Big O Notation.
It is useful to group algorithms in categories based on time complexity.  To do this we generalise the time complexity using a notation called big O notation.

We take the dominant term - the one with the largest power.  And remove any of the coefficients.  Numbers multiplying it.  and put an O around it.

1/2N = O(N)
3N^2 + 2N = O(N^2)
5n + n^3 + n^2 = O(n^3)

We can now formally analyses our algorithm
Linear:
Best: O(1)
Average: O(n)
Worst: O(n)

Best: O(1)
Average: O(log )
Worst: O(log n)


# O(N) to O(log n)
Most algorithm optimisation involved changing something from O(N) to O(log n).

This is not just in computing.  Also everyday life.  Cutting carrots. Debugging (halving the code)

##Searching a sorted array.

Search the following array for the number 7.

test_sorted_array = [ 1, 3, 7 ,8 ,9 ,21 ,23 ,45 ];

###Average case
Given a number, how long on average will it take for the algorithm to find the position.
For an array of length it will on average take 1/2N steps
O(n)

###Worst case
What is the most number of steps the algorithm can take.
O(n)

#Best Case
What is the least number of steps the algorithm can take.
O(1)

https://en.wikipedia.org/wiki/Linear_search

###Sequential search/ linear searching
def linear_search(array, target)
  test_sorted_array.each_with_index do |item, index|
    return index if target = item
  end
  return nil
end

Can we find a log based approached to this?

##Binary Search
https://en.wikipedia.org/wiki/Binary_search_algorithm
Compare to middle number.

If smaller, repeat for upper section.
If larger, repeat with lower section.
If equals, return the position.

##Time complexity of binary search.
So what's the complexity of this algorithm.
Best case is 1, so
O(1)

What about the worst case. Each time we are removing half the array.
So to generalise for a case of 8 elements,  we get rid half, then half, so we go from 8,4,2,1
So 3 steps.  For 16 elements,  we go from 16,8,4,2,1  4 steps.
O(log n)

What we are describing here is logarithmic behaviour.  It is the inverse to exponential growth.  Log base 2 of n means how many times do we need to multiply two together to get b.

Draw graph of n^2, n, logn, 1, on board
Average Case:
O(log n)


#Sorting
A common task is to sort an array. Let's look at some algorithms that do this.

array = [5,1,3,7,4,8,6,2]

array.sort right!!?

##Bubble Sort. Swapping neighbours until completed.
Compare neighbours and swap. Do this throughout the whole array.
Repeat until a pass with no swaps.


First pass
(5,1,3,7,4,8,6,2) to (1,5,3,7,4,8,6,2) compare 5, 1 (swap)
(1,5,3,7,4,8,6,2) to (1,3,5,7,4,8,6,2) compare 5, 3 (swap)
(1,3,5,7,4,8,6,2) to (1,3,5,7,4,8,6,2) compare 5, 7
(1,3,5,7,4,8,6,2) to (1,3,5,4,7,8,6,2) compare 7 4 swap
(1,3,5,4,7,8,6,2) to (1,3,5,4,7,8,6,2) compare 7 8
(1,3,5,4,7,8,6,2) to (1,3,5,4,7,6,8,2) compare 8,6 swap
(1,3,5,4,7,6,8,2) to (1,3,5,4,7,6,2,8)  compare 8,2 swap


... repeat until pass with no swaps


Each pass takes N steps O(N).  
We need O(N) passes.
O(n^2)
Best Case: O(n)
Worst Case: O(n^2)
Average Case: O(n^2)

##Merge Sort.
Divide and conquer algorithm.
Divide into single elements. Merge adjacent list into to join them together into small sorted lists.

5  1  3  7  8  4  6  2

(1,5) (3,7) (4,8) (2,6)

(1,3,5,7) (2,4,6,8)

(1,2,3,4,5,6,7,8)



Each step is again O(n). Merging sorted lists.

What we have gained here is that the amout of steps needed is is now log(n).  We are halving each time!
Looking to try to half each time is this movement from O(N) to O(log(n)).  We have managed to do this for one of the steps in our sorting algorithm

Example performance with 128 elements.
n^2
eg  128^2
16384

n log(n)
128 * log 128
896

Graph
http://bigocheatsheet.com/

Quicksort is another algorithm with a O(nlogn) average time complexity that is commonly used in practice.
