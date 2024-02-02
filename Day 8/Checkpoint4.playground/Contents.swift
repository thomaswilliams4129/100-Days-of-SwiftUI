import UIKit

enum SqrtError: Error {
    case outOfBounds, noRoot
}

func findSqrt(_ number: Int) throws -> String {
    if number < 1 || number > 10000 {
        throw SqrtError.outOfBounds
    }
    
    var hasSqrt = false
    var result = ""
    
    for i in 1...number {
        if(i * i == number) {
            result = "\(i)"
            hasSqrt = true
        }
    }
    
    if(!hasSqrt) {
        throw SqrtError.noRoot
    } else {
        return result
    }
}

do {
    var number = 4
    let result = try findSqrt(number)
    print("The square root of \(number) = \(result)")
} catch SqrtError.outOfBounds {
    print("The number is out of bounds. Less than 1 or greater than 10,000.")
} catch SqrtError.noRoot {
    print("No Root")
}

