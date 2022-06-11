"""
Checkpoint 2
This time the challenge is to create an array of strings, then write some code that prints the number of items in the array and also the number of unique items in the array.
"""

let strings = ["zero", "one", "two", "three", "four", "five", "zero"]

print(strings.count)

let unique = Set(strings)

print(unique.count)

"""
1. How to use type annotations
"""

//let surname = "Lasso"
//var score = 0

let surname: String = "Lasso"
//var score: Int = 0

var score: Double = 0

let playerName: String = "Roy"

var luckyNumber: Int = 13

let pi: Double = 3.141

var isAuthenticated: Bool = true

var albums: [String] = ["Red", "Fearless"]

var user: [String: String] = ["id": "@twostraws"]

var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]

var teams: [String] = [String]()

var cities: [String] = []

var clues = [String]()

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light

let username: String
// lots of complex logic
username = "@twostraws"
// lots more complex logic
print(username)

//let score: Int = "Zero"
