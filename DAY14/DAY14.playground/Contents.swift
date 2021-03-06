"""
Checkpoint 9

Your challenge is this: write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.
"""

func randomPicker(list: [Int]?) -> Int {
    return list?.randomElement() ?? (0...100).randomElement()!
}

randomPicker(list: [])

"""
5. How to handle function failure with optionals
"""

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

let user = (try? getUser(id: 23)) ?? "Anonymous"
print(user)

"""
4. How to handle multiple optionals using optional chaining
"""

let names = ["Arya", "Bran", "Robb", "Sansa"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book {
    let title: String
    let author: String?
}

var book: Book? = nil
let author = book?.author?.first?.uppercased() ?? "A"
print(author)

"""
3. How to unwrap optionals with nil coalescing
"""

let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]

//let new = captains["Serenity"] ?? "N/A"

let new = captains["Serenity", default: "N/A"]

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"

//struct Book {
//    let title: String
//    let author: String?
//}
//
//let book = Book(title: "Beowulf", author: nil)
//let author = book.author ?? "Anonymous"
//print(author)

let input = ""
let number = Int(input) ?? 0
print(number)

"""
2. How to unwrap optionals with guard
"""

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}

//guard someArray.isEmpty else { return }

"""
1. How to handle missing data with optionals
"""

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

var username: String? = nil

if let unwrappedName = username {
    print("We got a user: \(unwrappedName)")
} else {
    print("The optional was empty.")
}

func square(number: Int) -> Int {
    number * number
}

//var number: Int? = nil
//
//if let unwrappedNumber = number {
//    print(square(number: unwrappedNumber))
//}
//
//if let number = number {
//    print(square(number: number))
//}
