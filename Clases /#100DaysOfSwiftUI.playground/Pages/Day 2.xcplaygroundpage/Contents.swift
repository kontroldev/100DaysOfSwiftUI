import Foundation

/// **Bool**
let filename = "paris.jpg"
print(filename.hasSuffix(".jpg"))

let number3 = 120
print(number3.isMultiple(of: 3))

let goodDogs = true
let gameOver = false

let isMultiple = 120.isMultiple(of: 3)

var isAuthenticated = false
isAuthenticated = !isAuthenticated
print(isAuthenticated)

isAuthenticated = !isAuthenticated
print(isAuthenticated)


var gameOver2 = false
print(gameOver)

gameOver2.toggle()
print(gameOver)


/// **String**
let firstPart = "Hello, "
let secondPard = "world!"
let greeting = firstPart + secondPard

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action
print(lyric)


let luggageCode = "1" + "2" + "3" + "5"


let quote = "Then he tapped a sign saying \"Believe\" and walked away."

let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) and I'm \(age) years old."
print(message)


let number = 11
/// ***Ya ves, el uso de + nos permite añadir cadenas a cadenas, enteros a enteros y decimales a decimales, pero no nos permite añadir enteros a cadenas. Por lo tanto, este tipo de código no está permitido:
//let missionMessage = "Apollo " + number + " landed on the moon."

let missionMessage = "Apollo " + String(number) + " landed on the moon."

let missionMessage2 = "Apollo \(number) landed on the moon."

print("5 x 5 is \(5 * 5)")
