"""
2. How to use trailing closures and shorthand syntax
"""

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]

//let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//})
//
//print(captainFirstTeam)

//let captainFirstTeam = team.sorted { name1, name2 in
//    if name1 == "Suzanne" {
//        return true
//    } else if name2 == "Suzanne" {
//        return false
//    }
//
//    return name1 < name2
//}

//var captainFirstTeam = team.sorted {
//    if $0 == "Suzanne" {
//        return true
//    } else if $1 == "Suzanne" {
//        return false
//    }
//
//    return $0 < $1
//}

//let reverseTeam = team.sorted {
//    return $0 > $1
//}

//let reverseTeam = team.sorted { $0 > $1 }

let tOnly: [String] = team.filter { $0.hasPrefix("T") }
print(tOnly)

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

"""
1. How to create and use closures
"""

func greetUser() {
    print("Hi there!")
}

greetUser()

//var greetCopy = greetUser
//greetCopy()

//let sayHello = {
//    print("Hi there!")
//}
//
//sayHello()

let sayHello = { (name: String) -> String in
    "Hi \(name)!"
}

var greetCopy: () -> Void = greetUser

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)

sayHello("Taylor")

let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()
print(sortedTeam)

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

//let captainFirstTeam = team.sorted(by: captainFirstSorted)
//print(captainFirstTeam)

let captainFirstTeam = team.sorted(by: { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
})
