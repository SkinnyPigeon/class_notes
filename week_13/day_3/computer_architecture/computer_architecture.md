##Computer Architecture,

##Learning Objectives
 - Basic understanding of computer hardware
 - CPU
 - Memory
  - Ram
 - Hard Drive

##Introduction
Let's think about a very simple program.

```
  irb
  5 + 3
```
Ruby returns to us the answer 8.  But what happened here?  How was the hardware of you computer utilised?  In this lesson we will go through this at a basic level.  This isn't a hardware course, but having a basic understanding can help us as programmers


##CPU - Central Processing Unit
The brain of the computer - responsible for doing the processing.  Here are the circuits for doing mathematical and logical operations( adding subtracting ). It is the CPU that carries out the instructions defined by the computer program.  It will do the addition,  and return the sum.

##Compiling.
The CPU doesn't understand Ruby, or Python or any other programming language.
Your program is compiled down into a machine code (via assembly), specific for the CPU you are running on. This will tell the CPU the steps to perform.

##Memory
When told to add the numbers, the CPU will need store the numbers to add somewhere - memory.  RAM. Random Access Memory is the primary storage.  It is here that values are stored and then accessed by the CPU. It will then store the output to a new memory location.

##Registers
Trips to accessing RAM are often very expensive compared to the speed taken for the CPU to perform computations. Modern CPU tend to have small storages that it can access far faster than RAM, these are called registers.  

##Hard Drive
While our program is running the data lives in RAM, however, when the program stop it will all be lost. Often we need to store our data somewhere that will live on for longer than the program. Hard drives provide physical storage for persisting data. Traditionally this has been magnetic tape, but more Solid State Hard Drives (transistors) are becoming more common.

###Virtual Memory
Some computers have a fallback for when memory RAM is exhausted.  It will start using the Hard Drive as memory.  Writing to and reading to the hard drive is vastly slower than writing to RAM.
