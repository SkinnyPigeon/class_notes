# Advanced Testing

## Objectives

- Understand how to control randomness
- Understand what stubbing is for
- Understand what a mock is for
- Understand the difference between a mock and a stub

# Intro

So far, we have learned that coding to interfaces instead of concrete classes is a Good Thing and it makes our lives easier and happier. We've mentioned a few times that it really helps us for testing too, but we haven't really had a close look at this. We're going to do this today.

[i:] Give out starter code

We have a really silly game here, which simply rolls a dice and if the result is greater than 2 it returns sucess for that turn. Whoot. Super 

If we compile this and try to run the unit tests, we are going to have a problem. Sometimes the test passes, and sometimes the test fails. Why?

The randomness is not being controlled. Sometimes it will roll greater than 2, and sometimes not. How can we deal with this? Luckily, we have a few weapons ar our disposal.