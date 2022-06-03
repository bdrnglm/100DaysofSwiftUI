"""
Your goal is to write a Swift playground that:

Creates a constant holding any temperature in Celsius.
Converts it to Fahrenheit by multiplying by 9, dividing by 5, then adding 32.
Prints the result for the user, showing both the Celsius and Fahrenheit values.
"""

let celsius: Double = 30
var fahrenheit: Double { celsius * 9 / 5 + 32}

print("\(Int(celsius))°C is equal to \(Int(fahrenheit))°F")
