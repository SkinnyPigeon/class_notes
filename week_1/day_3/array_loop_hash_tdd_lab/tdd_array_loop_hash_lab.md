### TDD Lab

Create and test-drive the following functions:

1. Given two arrays:
    ```
    prices = [ 1.23, 6.98, 8.43, 2.45 ]
    costs = [ 4.23, 1.12, 0.52, 8.67 ]
    ```
    - create a function that takes two arrays and adds together the lengths of the arrays.

    Expectation: 8

2. Given this array:
    ```
      data = [ 1, 2, 3, 4 ,5 ]
    ```
    - create a function that takes an array of numbers and returns the sum total.

    tips: use a loop in your function!

    Expectation: 15

3. Given this array:
    ```
    hogwarts = [ 'Hufflepuff', 'Slytherin', 'Gryffindor', 'Ravenclaw' ]
    ```

    - create a ```find_item?``` method that returns true if an item is contained in a given array and false if not.

    tips: a loop could be useful in this function!
    tips: ? at the end of a method indicates it's a predicate (it will return true or false)

    Expectation: Ravenclaw => true. Batman => false

4. Given this hash:
    ```
    teacher_wallets = {
      'Sandy' => 12,
      'Zsolt'  => 10,
      'Val'  => 1356,
      'Jay' => 1
    }
    ```
    - create a function that will return the first key name in a hash.

    tips: there is a method on hash called keys - look it up in the docs: http://docs.ruby-lang.org/en/2.0.0/Hash.html

    Expectation: 'Sandy'

5. Given this hash:
    ```
    countries = {
      uk: {
        capital: 'London',
        population: 60
      },
      france: {
        capital: 'Paris',
        population: 70
      },
      italy: {
        capital: 'Rome',
        population: 56
      }
    }
    ```
    - create a function that will return an array of capitals

    tips: you can pass an entire hash to your function e.g. array_of_capitals( countries )

    Expectation: [ 'London', 'Paris', 'Rome' ]

