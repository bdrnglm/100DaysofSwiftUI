"""
Checkpoint 6

To check your knowledge, here’s a small task for you: create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
"""

enum gearChange { case up, down }

struct Car {
    let model: String = "Tay Swa"
    let seats: Int = 5
    private(set) var gear: Int = 1
        
    mutating func changeGear(gear: gearChange) {
        if gear == .up {
            if self.gear < 6 {
                self.gear += 1
                print("Geared up to \(self.gear)!")
            } else {
                print("Can't go any higher!")
            }
        } else {
            if self.gear > 1 {
                self.gear -= 1
                print("Geared down to \(self.gear)")
            } else {
                print("You can't go any lower!")
            }
        }
    }
}

var merco = Car()
merco.changeGear(gear: .up)
merco.changeGear(gear: .up)
merco.changeGear(gear: .up)
merco.changeGear(gear: .up)
merco.changeGear(gear: .down)
merco.changeGear(gear: .up)
merco.changeGear(gear: .down)
merco.changeGear(gear: .down)
merco.changeGear(gear: .up)
merco.changeGear(gear: .up)

"""
2. Static properties and methods
"""

struct School {
    static var studentCount = 0
    
    static func add(student: String) {
        print("\(student) joined the school.")
        studentCount += 1
    }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

struct AppData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}

struct Employee {
    let username: String
    let password: String

    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

"""
1. How to limit access to internal data using access control
"""

struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
        funds += amount
    }

    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
    print("Withdrew money successfully")
} else {
    print("Failed to get the money")
}
