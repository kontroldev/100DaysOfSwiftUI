//: [Previous](@previous)

import Foundation

/*:
 # Aprende Swift esencial en una hora

 Esto es lo menos que necesitas saber para empezar con Swift.

 Paul Hudson @twostraws

 ## Creación de constantes y variables
 */
var name = "Ted"
name = "Rebecca"
let user = "Daphne"
print(user)

/*:
 ## Cadenas
 */
let actor = "Tom Cruise"
let quote = "He tapped a sign saying \"Believe\" and walked away."
let movie = """
A day in
the life of an
Apple engineer
"""
print(actor.count)
print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))

/*:
 ## Enteros
 */
let score = 10
let higherScore = score + 10
let halvedScore = score / 2

var counter = 10
counter += 5

let number = 120
print(number.isMultiple(of: 3))

let id = Int.random(in: 1...1000)

/*:
 ## Decimales
 */
let decimalScore = 3.0

/*:
 ## Booleanos
 */
let goodDogs = true
let gameOver = false

var isSaved = false
isSaved.toggle()

/*:
 ## Unir cadenas
 */
let name2 = "Taylor"
let age = 26
let message = "I'm \(name2) and I'm \(age) years old."
print(message)

/*:
 ## Matrices
 */
var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]

print(colors[0])
print(readings[2])

colors.append("Tartan")
colors.remove(at: 0)
print(colors.count)
print(colors.contains("Octarine"))

/*:
 ## Diccionarios
 */
let employee = [
    "name": "Taylor",
    "job": "Singer"
]
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])

/*:
 ## Conjuntos
 */
var numbersSet: Set = [1, 1, 3, 5, 7]
numbersSet.insert(10)
print(numbersSet)

/*:
 ## Enums
 */
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}
var day = Weekday.monday
day = .friday

/*:
 ## Anotaciones de tipo
 */
var score2: Double = 0
let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
var albums: [String] = ["Red", "Fearless"]
var user2: [String: String] = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])

/*:
 ## Condiciones
 */
let age2 = 16
if age2 < 12 {
    print("You can't vote")
} else if age2 < 18 {
    print("You can vote soon.")
} else {
    print("You can vote now.")
}

let temp = 26
if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

/*:
 ## Cambiar declaraciones
 */
enum Weather {
    case sun, rain, wind
}
let forecast = Weather.sun

switch forecast {
case .sun:
    print("A nice day.")
case .rain:
    print("Pack an umbrella.")
default:
    print("Should be okay.")
}

/*:
 ## El operador condicional ternario
 */
let age3 = 18
let canVote = age3 >= 18 ? "Yes" : "No"
print(canVote)

/*:
 ## Bucles
 */
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os).")
}

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

var lyric = "Haters gonna"
for _ in 1...5 {
    lyric += " hate"
}
print(lyric)

var count = 10
while count > 0 {
    print("\(count)…")
    count -= 1
}
print("Go!")

let files = ["me.jpg", "work.txt", "sophie.jpg"]
for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }
    print("Found picture: \(file)")
}

/*:
 ## Funciones
 */
func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}
printTimesTables(number: 5)

func rollDice() -> Int {
    Int.random(in: 1...6)
}
let result = rollDice()
print(result)

func getUser() -> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}
let user3 = getUser()
print("Name: \(user3.firstName) \(user3.lastName)")

let (firstName, _) = getUser()
print("Name: \(firstName)")

/*:
 ## Personalizar las etiquetas de parámetros
 */
func greet(person: String, from hometown: String) {
    print("Hello \(person)! Glad you could visit from \(hometown).")
}
greet(person: "Bill", from: "Cupertino")

//: [Next](@next)

