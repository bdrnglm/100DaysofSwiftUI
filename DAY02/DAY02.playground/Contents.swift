"""
Checkpoint 2

Creates a constant holding any temperature in Celsius.
Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
Prints the result for the user, showing both the Celsius and Fahrenheit values.
"""

let celsius: Double = 30
var fahrenheit: Double { celsius * 9 / 5 + 32}

print("\(Int(celsius))°C is equal to \(Int(fahrenheit))°F")

"""
2. How to join strings together
"""

let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)

let luggageCode = "1" + "2" + "3" + "4" + "5"

let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)

let number = 11
//let missionMessage = "Apollo " + number + " landed on the moon."

//let missionMessage = "Apollo " + String(number) + " landed on the moon."

let missionMessage = "Apollo \(number) landed on the moon."

print("5 x 5 is \(5 * 5)")

"""
1. How to store truth with Booleans
"""

let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

//let number = 120
print(number.isMultiple(of: 3))

let goodDogs = true
//let gameOver = false

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)
isAuthenticated = !isAuthenticated
print(isAuthenticated)

var gameOver = false
print(gameOver)

gameOver.toggle()
print(gameOver)
