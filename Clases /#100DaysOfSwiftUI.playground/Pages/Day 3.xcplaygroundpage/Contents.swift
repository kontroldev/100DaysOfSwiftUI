import Cocoa

/// **Arrays**
var beatles = ["Jonh", "Paul", "George", "Ringo"] // array de String
let number = [4, 8, 15, 16, 23, 41] //Array de Int
var temperatures = [25.3, 28.2, 26.4]  // Arrray de Dounles

/// ***Esto confunde un poco a los principiantes, pero Swift en realidad cuenta el índice de un elemento desde cero en lugar de uno: beatles[0] es el primer elemento, y beatles[1] es el segundo, por ejemplo.

print(beatles[0])
print(number[1])
print(temperatures[2])
//Asegúrese de que exista un elemento en el índice que está solicitando, de lo contrario su código se bloqueará; su aplicación dejará de funcionar.


// Añadir datos a una 'Array'
beatles.append("Adrian")

beatles.append("Allen")
beatles.append("Adrian")
beatles.append("Novall")
beatles.append("Vivian")

// Solo podremos agregar valores del mismo tipo.
//temperatures.append("Chris") <- Esta linea esta comentada por que 'temperature' es de datos 'Int' y le queremos añadir un String.


/*Esto también se aplica a la lectura de datos de la matriz: Swift sabe que la matriz de beatles contiene cadenas, por lo que cuando leas un valor, siempre obtendrás una cadena. Si intentas hacer lo mismo con los números, siempre obtendrás un entero. Swift no te permitirá mezclar estos dos tipos diferentes, por lo que este tipo de código no está permitido.
 
let firsBeatles = beatles[0]
let firsNumber = number[0]

let notAllowed = firsBeatles + firsNumber*/


//Puedes ver esto más claramente cuando quieras comenzar con una matriz vacía y añadirle elementos uno por uno. Esto se hace con una sintaxis muy precisa.
var score = Array<Int>()

score.append(100)
score.append(80)
score.append(85)

print(score[1])


//⚠️Las matrices son tan comunes en Swift que hay una forma especial de crearlas: en lugar de escribirArrayArray<String>, puedes escribir [String] Por lo tanto, este tipo de código es exactamente el mismo que antes.

var albums = Array<String>()
// Podemos crearlo de las dos maneras.⬆️⬇️
var albums2 = [String]()

//La seguridad del tipo de Swift significa que siempre debe saber qué tipo de datos almacena una matriz. Eso podría significar ser explícito al decir que los álbumes son un Array<String>, pero si proporcionas algunos valores iniciales, Swift puede averiguarlo por sí mismo.
var albums3 = ["Folklore"]

albums3.append("fearless")
albums3.append("Red")


//Podemos usar '.count' para leer cuántos elementos hay en una 'Array', al igual que lo hicimos con los 'String'.
print(albums3.count)


//Podemos eliminar elementos de una ?Array' utilizando remove(at:) para eliminar un elemento en un índice específico, o removeAll() para eliminar todo.
var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.remove(at: 2)
print(characters.count)

characters.removeAll()
print(characters.count)


//Podemos comprobar si en un 'Array' contiene un elemento en particular usando contains(), de esta manera:
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))


//Podemos ordenar una 'Array' usando sorted()), de esta manera:
let cities = ["London", "Tokyo", "Roma", "Budapest"]
print(cities.sorted())
//Eso devuelve una nueva 'Array' con sus elementos ordenados en orden ascendente, lo que significa alfabéticamente para las cadenas, pero numéricamente para los números: la matriz original permanece sin cambios.


//Podemos invertir un 'Array' llamando a reversed() en ella:
let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)



/// **Diccionarios**
///  *Es una estructura de datos que almacena elementos en [clave:valor]


//Un 'Array' que contiene los detelles de un empleado.
var employee = ["Taylor Swift", "Singer", "Nashville"]

print("Name: \(employee[0])")
print("Job title: \(employee[1])")
print("location: \(employee[2])")


print("Name: \(employee[0])")
employee.remove(at: 1)
print("Job title: \(employee[1])")

//print("Location: \(employee[2])")



//let employee2 = ["name": "Taylor Swift", "job": "Singer", "location": "Nashville"]

//Lo podemos dividir en líneas individuales, tendrás una mejor idea de lo que hace el código:
let employee2 = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville"
]

print(employee2["name"])
print(employee2["job"])
print(employee2["location"])

//Si lo intentamos en un Playground, verás que Xcode lanza varias advertencias a lo largo de la línea de "¿Expresión implícitamente coaccionada desde 'String?' A "Cualquier". Peor aún, si miras la salida de tu Playground, verás que imprime Opcional ("Taylor Swift") en lugar de solo Taylor Swift.

print(employee2["password"])
print(employee2["status"])
print(employee2["manager"])

/// ***Todo eso es código Swift es válido, pero estamos intentando leer claves de diccionario que no tienen un valor adjunto. Por supuesto, Swift podría dar un error, al igual que lo hará si lee un índice de 'Array' que no existe, pero eso haría muy difícil trabajar con él, al menos si tienes un 'Array' con 10 elementos, sabes que es seguro leer los índices de 0 a 9. ("Índices" es simplemente la forma plural de "índice", por si acaso no estabas seguro).*


//Podemos crear un 'Diccionario' vacio de esta manera.
print(employee2["name", default: "Unknown"])
print(employee2["job", default: "Unknown"])
print(employee2["location", default: "Unknown"])


//Ejemplo, podemos hacer un seguimiento de qué estudiantes se han graduado de la escuela usando cadenas para los nombres y booleanos para su estado de graduación: [clave:valor]
let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false
]

//o lo mismo con este ejmplo pero los años que se llevaron los juegos olimpicos.
let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo"
]

print(olympics[2012, default: "Unknown"])


//Podemos crear un 'Diccionario' vacío utilizando cualquier dato explícito que desee almacenar, y luego establecer las claves, una a una.

var heights = [String: Int]()

heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["LeBron James"] = 206

//Otro ejemplo pero con superhéroes. 👇
var archEnemies = [String: String]()

archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"

// y de esta manera podemos reescribir los valores de un diccionario.
archEnemies["Batman"] = "Penguin"


/// **SETS**
/// *Es una coleccion NO ordenada de elementos unicos, que no se pueden repetir.*

//Asi se crea un Set.
let people = Set( ["Denzel Washigton", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])

print(people)


var people2 = Set<String>()

people2.insert("Denzel Washigton")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")

// ⚠️En un 'Set' para añadir elementos lo hacemos con la palabra '.insert' y el un 'Array' recordamos que lo haciamos con un '.append', ya que la diferencia de estos, es que el Set no guarda el orden y no tiene sentido usar el .append aqui.

print(people2)


/// **ENUMS**
/// *Un enum (abreviatura de enumeración) es un tipo de datos que permite definir un conjunto de valores relacionados. Estos valores son opciones específicas que se pueden asignar a una variable o constante. Los enums son más potentes que los enums en algunos otros lenguajes de programación, ya que pueden contener métodos y propiedades asociadas.

var selected = "Monday"

selected = "Tuesday"
selected = "January"
selected = "Friday"


enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}
//Eso llama una nueva enumeración del día de la semana, y proporciona cinco casos para manejar los cinco días de la semana

//Ahora, en lugar de usar cadenas, usaríamos la enumerada. Prueba esto en tu patio de recreo:
var day = Weekday.monday

day = Weekday.tuesday
day = Weekday.friday
//Con ese cambio no puedes usar accidentalmente "Viernes" con un espacio adicional, o poner un nombre de mes en su lugar; siempre debes elegir uno de los días posibles enumerados en la enumeración. Incluso verás que Swift ofrece todas las opciones posibles cuando hayas escrito Weekday.

//Tambien podemos hacer un 'enum' de esta manera. 👇
enum Weekday2 {
    case monday, tuesday, wednesday, thursday, friday
}


//Recuerda que una vez que asigna un valor a una variable o constante, su tipo de datos se vuelve fijo: no puede establecer una variable en un 'String' al principio, y luego un 'Int' más tarde. Bueno, para las enumeraciones, esto significa que puedes omitir el nombre de la enumeración después de la primera tarea.

var day2 = Weekday2.monday

day2 = .tuesday
day2 = .friday
