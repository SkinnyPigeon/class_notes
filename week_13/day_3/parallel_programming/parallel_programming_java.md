#Parallel Programming

##Learning Objectives

#Intro
Do this first.

rbenv install jruby

Parallel computing involves having multiple things happening at the same time.  Let's look into why we as programmers might care about this.

##Moores law
https://en.wikipedia.org/wiki/Moore%27s_law#/media/File:Transistor_Count_and_Moore%27s_Law_-_2011.svg


For years parallel programming was something not really seen outside the super-computing world.
This was because personal computers had a single cpu(core), but super computers had multiple, hundreds, thousands of cores.

Number of transistors in a circuit doubling every year.  Used to mean chips were getting faster,
Individual CPU's are no longer getting faster.  Boo. Chip manufactures are instead just chucking more processors on a chip.  Multi-core.

Parallel programming is about writing your programming so that multiple parts of your program can be run at the same time, taking advantage of systems with multiple cores.



With multi-core processors being the norm, parallel programming are becoming more pronounced throughout the industry when building common applications.  Particularly important in mobile applications - we'll see later.  Often is abstracted away from us, so no need to worry.  However good to have some understanding about how it works as can help in a tight situation.

This is a quick introduction to parallel programming and it's relevance to web and mobile application development.  This is a whole course in itself!

##Parallel Decomposition

To create parallel programs we need to decompose our program into strands that can run in parallel. We can think of this as producing multiple execution stacks.

##Thread/Processes
There are two types of strands execution that we can run.  Threads are execution strands that can share memory.  Processes are execution strands that cannot.  When we have been starting our application, ruby, node rails.  Our Operating system starts up a process to run it and sets up a main thread.  Multi threaded applications are application which decompose this main process into multiple threads.
Threads are often thought of as light weight threads.  

[Table here]
https://www.toptal.com/ruby/ruby-concurrency-and-parallelism-a-practical-primer
[i]: Draw Rubot with multiple threads.

For mobile applications the process of decomposing your application into multiple threads is particularly relevant.




##Parallel Decomposition example.
So let's see how we decompose a ruby application into multiple threads.

Imagine we had huge array and for each item in the array we wanted to do an expensive operation.
This is common in finance, physics applications.

In our single threaded applications we would iterate through the loop performing the operation one by one.

But when we think about it, these are independent operations so can all happen in parallel.

Ruby is a bit behind the game when it comes to parallel programming.  The version of Ruby we are using MRI actually has a lock that does not allow multiple threads to calculate at the same time.

rbenv local jruby


Hand out sequential code. 'thread_play_sequential'


###Splitting up across multiple threads.
```
  start_time = Time.now

  sum = 0#shared
  t1 = Thread.new do
    (1..array_size/2).each do |number|
      sum += expensive_operation(number)
    end
  end

  t2 = Thread.new do
    ((array_size/2+1)..array_size).each do |number|
      sum += expensive_operation(number)
    end
  end

  t1.join
  t2.join
```

The answer is wrong.  What happened here.

##Concurrency Issues - Thread Safety
While multi threaded applications are very powerful there are situations we need to be aware of.
Multiple threads share memory.  Concurrent threads writing to the same item at the same time can result in many problems. Writing to memory is not an atomic operation.  One thread has taken it out of memory,  the other has come and in that time the other thread has written to memory location!

##Mutex/Lock - Mutual Exclusion.
One at a time please!
```
t1 = Thread.new do
  (1..array_size/2).each do |number|
    mutex.synchronize { sum += expensive_operation(number) } #Lock here added
  end
end

t2 = Thread.new do
  ((array_size/2+1)..array_size).each do |number|
    mutex.synchronize { sum += expensive_operation(number) }  #Lock here added
  end
end
```
Okay we now get the write answer.  Locks are expensive and we aren't becuase of this we aren't seeing any performance benefits.  Can you think of another approach.

[i]: Remember to remove Mutex.
```
sum_1 = 0
t1 = Thread.new do
  (1..array_size/2).each do |number|
    sum_1 += expensive_operation(number)
  end
end

sum_2 = 0
t2 = Thread.new do
  ((array_size/2+1)..array_size).each do |number|
    sum_2 += expensive_operation(number)
  end
end

...

sum = sum_1 + sum_2

```

#Web/Mobile Development

#Mobile UI
Take if off the main thread!

In mobile application development,  creating threads to handle parts of our program is key.  
In languages like Java,  our operations are all blocking (not like in Javascript).  Hence if we made an HTTP request on the main thread,  the one that is handling the UI,  the program would not be able do anything until the request completed.  Creating separate threads to handle this operation is a must.

Typically only the main thread has access to the User Interface.  The common terminology used is the UI thread or main thread.  With other threads refered to as worker threads.
http://developer.android.com/training/volley/simple.html

#Javascript
Javascript in the browser is commonly described as a single threaded environment.  This is not entirely true.  We only have control of one thread, however when we do async operations, such as making an ajax request a separate thread is created to handle this.  Taking it off the main UI thread.  However like a mobile application we still have the same problem if we are doing heavy computation.  So how can we take this off the UI thread in JS.

##Webworkers
We can set up another 'thread' in JS using something called a WebWorker.  This is a really more like a process as it cannot share memory with the main thread.  WebWorkers cannot talk to the DOM.  The latest high performance applications use React on a webworker, creating the virtual DOM. Allow for lighting fast mobile web applications.


##GPUs
http://www.nvidia.com/object/what-is-gpu-computing.html#axzz41l9NE4TY
Graphics process takes on similar problems to what we just described. Many pixels need to be updated and they can also be calculated independently.  
GPU graphic processing units, are hugely parallel processing devices that we designed to handle this task.  They contain hundreds or thousands of low performance cores.  Each core will handle a specific set of pixels,  so the image can be updated in a fraction of the time by using a multiple core.


###GPGPU
Many people writing high performance applications realised that a GPU would be ideal for running their multi-threaded applications,  applications that could be decomposed into hundreds, or thousands of threads. They would hack their applications to look like graphics applications and get the results.
GPU makers got onto this and started making chips that are designed for this.


If this stuff interests you.
https://www.epcc.ed.ac.uk/

<!-- ##Recap
Parallel computing involves having multiple things happening at the same time.

Individual CPU's are no longer getting faster (Moores Law no longer). Just chucking many cores on a single processor.  To get draw performance out of processor parallel programming is entering the everyday.

Processes are execution strands that do not share memory.
Threads do.

Mobile -->
