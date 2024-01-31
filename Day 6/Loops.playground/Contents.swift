import UIKit

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
    
    for j in 1...12 {
        print("     \(j) x \(i) is \(j * i)")
    }
    
    print()
    
    for i in 1...5 {
        print("Counting from 1 through 5: \(i)")
    }
    
    for i in 1..<5 {
        print("Counting from 1 up 5: \(i)")
    }
    
    var lyric = "Haters gonna"
    
    for _ in 1...5 {
        lyric += " hate"
    }
}
