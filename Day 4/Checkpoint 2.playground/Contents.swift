import UIKit

/// Checkpoint 2
///Create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array

var appleProducts = ["Mac Studio", "Macbook Pro", "AirPods Pro", "AirPods Pro", "AirPods Max", "Magic Keyboard", "Magic Mouse", "Studio Display", "Studio Display", "iPad Mini", "iPhone 13 Pro Max"]

print("Number of items = \(appleProducts.count)")

var uniqueAppleProducts = Set(appleProducts)

print("Number of unique items = \(uniqueAppleProducts.count)")00
