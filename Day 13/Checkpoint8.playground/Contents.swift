import UIKit

/// make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:
///     A property storing how many rooms it has.
///     A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
///     A property storing the name of the estate agent responsible for selling the building.
///     A method for printing the sales summary of the building, describing what it is along with its other properties.
///

protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get set }
    var estateAgent: String { get set }
    var salesSummary: [String] { get set }
}

struct House: Building {
    var numberOfRooms = 4
    var cost = 400000
    var estateAgent = "Thomas Williams"
    var salesSummary = ["2015 - Williams Family", "2010 - Kinley Family", "2005 - Sovercools Family"]
}

struct Office: Building {
    var numberOfRooms = 2
    var cost = 150000
    var estateAgent = "Layna Sovercool"
    var salesSummary = ["2000 - Purfied Water", "2004 - Brite Leaf", "2020 - RHN Wagyu"]
}

func printSalesSummary(using building: Building) {
    
    print("Sales Summary:")
    for sale in building.salesSummary {
        print(sale)
    }
}

let house = House()
let office = Office()

printSalesSummary(using: house)
printSalesSummary(using: office)
