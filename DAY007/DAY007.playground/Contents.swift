"""
4 . How to customize parameter labels
"""

func rollDice(sides: Int, count: Int) -> [Int] {
    // Start with an empty array
    var rolls = [Int]()

    // Roll as many dice as needed
    for _ in 1...count {
        // Add each result to our array
        let roll = Int.random(in: 1...sides)
        rolls.append(roll)
    }

    // Send back all the rolls
    return rolls
}

let rolls = rollDice(sides: 6, count: 4)

func hireEmployee(name: String) { }
func hireEmployee(title: String) { }
func hireEmployee(location: String) { }

let lyric = "I see a red door and I want it painted black"
print(lyric.hasPrefix("I see"))

//func isUppercase(string: String) -> Bool {
//    string == string.uppercased()
//}
//
//let string = "HELLO, WORLD"
//let result: Bool = isUppercase(string: string)

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result = isUppercase(string)

//func printTimesTables(number: Int) {
//    for i in 1...12 {
//        print("\(i) x \(number) is \(i * number)")
//    }
//}
//
//printTimesTables(number: 5)

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)

"""
3. How to return multiple values from functions
"""

func isUppercase(string: String) -> Bool {
    string == string.uppercased()
}

//func getUser() -> [String] {
//    ["Taylor", "Swift"]
//}
//
//let user: [String] = getUser()
//print("Name: \(user[0]) \(user[1])")

//func getUser() -> [String: String] {
//    [
//        "firstName": "Taylor",
//        "lastName": "Swift"
//    ]
//}
//
//let user: [String: String] = getUser()
//print("Name: \(user["firstName", default: "Anonymous"]) \(user["lastName", default: "Anonymous"])")

//func getUser() -> (firstName: String, lastName: String) {
//    (firstName: "Taylor", lastName: "Swift")
//}
//
//let user: (firstName: String, lastName: String) = getUser()
//print("Name: \(user.firstName) \(user.lastName)")

//func getUser() -> (firstName: String, lastName: String) {
//    ("Taylor", "Swift")
//}

//func getUser() -> (String, String) {
//    ("Taylor", "Swift")
//}
//
//let user: (String, String) = getUser()
//print("Name: \(user.0) \(user.1)")

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

//let user (String, String) = getUser()
//let firstName = user.firstName
//let lastName = user.lastName
//
//print("Name: \(firstName) \(lastName)")
//
//let (firstName, lastName) = getUser()
//print("Name: \(firstName) \(lastName)")

let (firstName, _) = getUser()
print("Name: \(firstName)")

"""
2. How to return values from functions
"""

import Cocoa

let root = sqrt(169)
print(root)

func rollDice() -> Int {
    Int.random(in: 1...6)
}

//let result = rollDice()
//print(result)

func areLettersIdentical(firstString: String, secondString: String) -> Bool {
    firstString.sorted() == secondString.sorted()
}

func pythagoras(a: Double, b: Double) -> Double {
    sqrt(a * a + b * b)
}

let c = pythagoras(a: 3, b: 4)
print(c)

"""
1. How to reuse code with functions
"""

func showWelcome() {
    print("Welcome to my app!")
    print("By default This prints out a conversion")
    print("chart from centimeters to inches, but you")
    print("can also set a custom range if you want.")
}

showWelcome()

let number = 139

if number.isMultiple(of: 2) {
    print("Even")
} else {
    print("Odd")
}

let roll = Int.random(in: 1...20)

func printTimesTables(number: Int, end: Int) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5, end: 20)
