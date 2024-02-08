import UIKit

/// write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.


func randomNumber(from listofIntegers: [Int]?) -> Int {
    return listofIntegers?.randomElement() ?? Int.random(in: 1...100)
}

var numbers: [Int]? = [1, 5, 15, 25, 98]
var numbersEmpty: [Int]? = nil

let randomNum = randomNumber(from: numbers)
let randomNumFromEmpty = randomNumber(from: numbersEmpty)


