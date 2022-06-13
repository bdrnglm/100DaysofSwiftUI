"""
Checkpoint 8

Your challenge is this: make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

A property storing how many rooms it has.
A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
A property storing the name of the estate agent responsible for selling the building.
A method for printing the sales summary of the building, describing what it is along with its other properties.
"""

protocol Building {
    var rooms: Int { get set }
    var cost: Int { get set }
    var name: String { get set }
    func summary()
}

struct House: Building {
    var rooms = 4
    var cost = 300_000
    var name = "Orpi"
    
    func summary() {
        print("This \(rooms) room\(rooms > 1 ? "s" : "") house listed by \(name) is evaluated at \(cost)€.")
    }
}

struct Office: Building {
    var rooms = 8
    var cost = 500_000
    var name = "Orpi Pro"

    func summary() {
        print("This \(rooms) room\(rooms > 1 ? "s" : "") office listed by \(name) is evaluated at \(cost)€.")
    }
}

Office().summary()

"""
3. How to create and use extensions
"""

import Cocoa

extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim () {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

var quote = "   The truth is rarely pure and never simple   "
let trimmed = quote.trimmingCharacters(in: .whitespacesAndNewlines)
quote.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

let lotr = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24)

"""
2. How to use opaque return types
"""

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

print(getRandomNumber() == getRandomNumber())

"""
1. How to create and use protocols
"""

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
        print("I'm driving \(distance)km.")
    }
    
    func openSunRoof() {
        print("It's a nice day!")
    }
}

struct Bicycle: Vehicle {
    let name = "Bike"
    var currentPassengers = 1
    func estimateTime(for distance: Int) -> Int {
        distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

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

let bike = Bicycle()
commute(distance: 50, using: bike)

getTravelEstimates(using: [car, bike], distance: 150)
