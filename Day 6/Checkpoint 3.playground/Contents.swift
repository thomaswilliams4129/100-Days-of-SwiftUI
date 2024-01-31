import UIKit

// Checkpoint 3
/// The problem is called fizz buzz, and has been used in job interviews, university entrance tests, and more for as long as I can remember. Your goal is to loop from 1 through 100, and for each number: 
///     If it’s a multiple of 3, print “Fizz”
///     If it’s a multiple of 5, print “Buzz”
///     If it’s a multiple of 3 and 5, print “FizzBuzz”
///     Otherwise, just print the number.


//So, here are some example values you should have when your code runs: 1 should print “1”
//  2 should print “2”
//  3 should print “Fizz”
//  4 should print “4”
//  5 should print “Buzz”
//  6 should print “Fizz”
//  7 should print “7”
//  …
//  15 should print “FizzBuzz”
//  …
//  100 should print “Buzz”


for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
            print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}


