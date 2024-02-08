import UIKit

let opposites = [
    "Mario" : "Wario",
    "Luigi" : "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var userName: String? = nil

if let unwrappedName = userName {
    print("We go a user: \(unwrappedName)")
} else {
    print("The optional was empty")
}

func square(number: Int) -> Int {
    number * number
}

var number: Int? = nil
if let number = number {
    print(square(number: number))
}

func printSqaure(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    
    print("\(number) x \(number) is \(number * number)")
}

printSqaure(of: 2)

var myVar: Int? = 3

if let unwrapped = myVar {
    print("Run if myVar has a value inside")
}


let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


