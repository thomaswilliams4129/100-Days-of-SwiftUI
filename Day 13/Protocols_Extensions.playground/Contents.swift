import UIKit

// protocols let us talk about the kind of functionality we want to work with, rather than the exact types
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }
    
    func travel(distance: Int) {
        print("I'm driving \(distance)km")
    }
    
    func openSunroof() {
        print("It's a nice day!")
    }
}

struct Bicyle: Vehicle {
    var name = "Bicyle"
    
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
            distance / 10
        }

        func travel(distance: Int) {
            print("I'm cycling \(distance)km.")
        }
}

// allows us to use the Vehicle fucntions in our method because any Vehicle must implement both estimateTime() and travel() methods
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

let car = Car()
commute(distance: 100, using: car)

let bike = Bicyle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)
