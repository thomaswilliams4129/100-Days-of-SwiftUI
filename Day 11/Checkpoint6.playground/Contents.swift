import UIKit

/// create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?

struct Vehicle {
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        
        if currentGear > 10 {
            self.currentGear = 10
            print("Max gear is 10. Set to highest gear 10.")
        } else {
            self.currentGear = currentGear
        }
    }
    
    mutating func changeGears(gear: Int) {
        if gear > 10 {
            currentGear = 10
            print("Max gear is 10. Set to highest gear 10.")
        } else {
            currentGear = gear
        }
    }
}

var vehicle = Vehicle(model: "Ford", numberOfSeats: 6, currentGear: 6)
print(vehicle.model)
print(vehicle.numberOfSeats)
print(vehicle.currentGear)
vehicle.changeGears(gear: 10)
print(vehicle.currentGear)


