"""
Checkpoint 7

Your challenge is this: make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

But there’s more:

The Animal class should have a legs integer property that tracks how many legs the animal has.
The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
The Cat class should have a matching speak() method, again with each subclass printing something different.
The Cat class should have an isTame Boolean property, provided using an initializer.
"""

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Woof!")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Woof! I'm a corgi! 👝")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Woof! I'm a poddle! 🧑‍🦱")
    }
}


class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Mew!")
    }
}

class Persian: Cat {
    override func speak() {
        print("Mew! I'm a persian! 🇮🇷")
    }
}

class Lion: Cat {
    override func speak() {
        print("Mew! I'm a lion! 🦁")
    }
}

"""
6. How to work with variables inside classes
"""

class User {
    var name = "Paul"
}

var user = User()
user.name = "Taylor"
user = User()
print(user.name)

"""
5. How to create a deinitializer for a class
"""

//class User {
//    let id: Int
//
//    init(id: Int) {
//        self.id = id
//        print("User \(id): I'm alive!")
//    }
//
//    deinit {
//        print("User \(id): I'm dead!")
//    }
//}
//
//var users = [User]()
//
//for i in 1...3 {
//    let user = User(id: i)
//    print("User \(user.id): I'm in control!")
//    users.append(user)
//}
//
//print("Loop is finished!")
//users.removeAll()
//print("Array is clear!")

"""
4. How to copy classes
"""

//class User {
//    var username = "Anonymous"
//
//    func copy() -> User {
//        let user = User()
//        user.username = username
//        return user
//    }
//}
//
//var user1 = User()
//var user2 = user1.copy()
//
//user2.username = "Taylor"
//
//print(user1.username)
//print(user2.username)

"""
3. How to add initializers for classes
"""

class Vehicle {
    let isElectric: Bool
    
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

let teslaX = Car(isElectric: true, isConvertible: false)

"""
2. How to make one class inherit from another
"""

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

final class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
    
    override func printSummary() {
        print("I'm a developer who will sometimes work \(hours) hours a day, but other times spend hours arguing about whether code should be indented using tabs or spaces.")
    }
}

final class Manager: Employee {
    func work() {
        print("I'm going to meetings for \(hours) hours.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)
robert.work()
joseph.work()

let novall = Developer(hours: 8)
novall.printSummary()

"""
1. How to create your own classes
"""

class Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10
