import Foundation


/// **variables
var name = "Ted"
name = "rebecca"
name = "Keeley"


/// **constantes
let character = "Daphne"
//character = "Eloise"
//character = "Francesca"


var playerName = "Roy"
print(playerName)

playerName = "Dani"
print(playerName)

playerName = "Sam"
print(playerName)


let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"



/// **String**
let actor = "Denzel Washington"
let filename = "paris.jpg"
let result = "⭐️ You win! ⭐️"

let quote = "Then he tapped a sign saying \"Belive\" and walked away."


let movie = """
A day in
the life of an
Apple engineer
"""

//No necesitas imprimir la longitud de una cadena directamente si no quieres, puedes asignarla a otra constante, como esta:
let nameLength = actor.count
print(nameLength)

//La segunda pieza útil de funcionalidad es uppercased()), que envía la misma cadena, excepto que cada una de sus letras está en mayúsculas:
print(result.uppercased)


print(movie.hasPrefix("a day"))
print(filename.hasSuffix(".jpg"))


/// **Int**
let score = 10
let reallyBig = 100_000_000

let lowerScore = score - 2
let higherScore = score + 10
let doubledscore = score * 2
let halvedScore = score / 2

var counter = 10
counter += 5
print(counter)


counter *= 2
counter -= 10
counter /= 2


//Por lo tanto, podríamos preguntarnos si 120 es un múltiplo de tres.
let number = 120
print(number.isMultiple(of: 3))
print(120.isMultiple(of: 3))


/// **Doubles**
let number2 = 0.1 + 0.2
print(number2)

let a = 1
let b = 2.0
let c = Double(a) + b


let double1 = 3.1
let double2 = 3131.3131
let double3 = 3.0
let int1 = 3

/// ***Combinado con la seguridad del tipo, esto significa que una vez que Swift ha decidido qué tipo de datos tiene una constante o variable, siempre debe contener ese mismo tipo de datos. Eso significa que este código está bien.
var name2 = "Nicolas Cage"
//name = 57


var rating = 5.0
rating *= 2
