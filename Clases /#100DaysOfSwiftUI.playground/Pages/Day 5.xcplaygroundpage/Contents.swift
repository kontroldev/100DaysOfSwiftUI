import Foundation

/// **If**
/// **un 'if' es una estructura de control que te permite realizar una evaluación condicional. Básicamente, un if te permite ejecutar cierto bloque de código solo si una condición especificada es verdadera.

/*Los programas muy a menudo toman decisiones:

-Si la puntuación del examen del estudiante fue de más de 80, imprima un mensaje de éxito.
-Si el usuario ha introducido un nombre que viene después del nombre de su amigo en orden alfabético, ponga el nombre del amigo primero.
-Si al añadir un número a una matriz hace que contenga más de 3 elementos, elimine el más antiguo.
-Si se le pidió al usuario que introdujera su nombre y no escribió nada en absoluto, déle un nombre predeterminado de "Anónimo".
Swift maneja estos con declaraciones if, que nos permiten comprobar una condición y ejecutar algo de código si la condición es verdadera.*/

//La puntuacion es 85
let score = 85

// si la puntuacion es mayor '>' a 80, imprimes esto.....
if score > 80 {
    print("Great job!")
}

//Mas ejemplos

let speed = 88
let percentage = 85
let age = 18

if speed >= 88 {  // si es mayor o igual que...
    print("Where we're going we don't need roads.")
}

if  percentage < 85  {  // si es menor que...
    print("Sorry, you failed the test.")
}

if age >= 18 {  // si es igual o menos que...
    print("You're elegible to vote.")
}


//Si el usuario ingresó un nombre que viene después del nombre de su amigo alfabéticamente, coloca el nombre del amigo primero. Has visto cómo `<`, `>=` y otros funcionan muy bien con números, pero también funcionan igual de bien con cadenas de texto directamente:

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")  // aqui interpolamos los nombres.
}

if ourName > friendName {
    print("It's \(ourName) vs \(friendName)")
}


//Si agregar un número a un array hace que contenga más de 3 elementos, elimina el más antiguo. Ya has conocido `append()`, `count` y `remove(at:)`, así que ahora podemos poner los tres juntos con una condición como esta.

// Hace un 'Array de 3 numeros [recuerda que los array, van entre corchetes]
var numbers = [1, 2, 3]

numbers.append(4) // añadimos un cuarto elemento

// Si tienes mas de 3 elementos. numbers.cuenta mayor de 3
if numbers.count > 3 {
    numbers.remove(at: 0) // elimina el elemento de la posicion 0
}

print(numbers)


//Si se le pidió al usuario que ingresara su nombre y no escribió nada en absoluto, dale un nombre predeterminado de "Anónimo".
let country = "Canada"

if country == "Australia" {  // si  son iguales ==
    print("G'day!")
}


let name = "Taylor Swift"

if name != "Anonymous" {  // no es igual !=
    print("Welcome, \(name)")
}

//En este caso, queremos comprobar si el nombre de usuario introducido por el usuario está vacío, lo que podríamos hacer.

var username = "taylorswift13"

if username == "" { // si nombre de usuario contiene un 'String' vacío
    username = "Anonymous" // le asignamos usename el valor de...
}

print("Welcome, \(username)!")
//Esa "" es una cadena vacía: comenzamos la cadena y terminamos la cadena, sin nada en el medio. Al comparar el nombre de usuario con eso, estamos comprobando si el usuario también ingresó una cadena vacía para su nombre de usuario, que es exactamente lo que queremos.


/*Ahora, hay otras formas de hacer esta comprobación, y es importante que entiendas lo que hacen.
 En primer lugar, podríamos comparar el recuento de la cadena, cuántas letras tiene, con 0.*/
if  username.count == 0 {
    username = "Anonymous"
}

// La funcion de arriba comprobara uno a uno todo el 'string' y nos devolvera un valor y lo comparamos si es igual a 0.
// Esto no es muy bueno en depende de que caso si tiene que comprobar muchos nombres y a veces es mejor  utilizar otra metodo: 👇

if username.isEmpty == true {
    username = "AnoNymous"
}
//Esto es mejor, pero podemos ir un paso más allá.En última instancia, lo que importa es que la condición debe reducirse a verdadera o falsa; Swift no permitirá nada más. En nuestro caso, 'username.isEmpty' ya es un booleano, lo que significa que será verdadero o falso, por lo que podemos hacer que nuestro código sea aún más simple:
if username.isEmpty {
    username = "Anonymous"
}
//Si isEmpty es cierta, la condición pasa y el nombre de usuario se establece en Anónimo, de lo contrario, la condición falla.


/// **Condiciones Multiples**

/// ** OPERADORES LOGICOS
//  Operador AND o &&  Los dos verdaderos
//  Operador OR o ||   Uno de los dos son verdaderos
//  Operador NOT o '!'   es diferente(cambia la condicion.)

let age2 = 16

if age2 >= 18 {
    print("You can vote in the next election.")
}

if age2 < 18 {
    print("Sorry, you're too young to vote.")
}

// Este codigo hace lo mismo pero usando 'else'
if age2 >= 18 {
    print("You can vote in the next election.")
} else {
    print("Sorry, you're too young to vote.")
}
//Swift solo necesita comprobar la edad una vez: si es mayor o igual a 18, se ejecuta el primer código print(), pero si es un valor menor que 18, se ejecuta el segundo código print().


//Hay una condición aún más avanzada llamada 'else if', que te permite ejecutar una nueva comprobación si la primera falla. Puedes tener solo uno de estos si quieres, o tener varios más si, e incluso combinar otro si con otro si es necesario. Sin embargo, solo puedes tener una más, porque eso significa "si todas las demás condiciones han sido falsas".

let a = false
let b = true

if a {
    print("Code to run if a is true")
} else if b {
    print("Code to run if a is false but b is true")
} else {
    print("Code to run if both a and b are false")
}


//Además de usar 'else' y 'else if' para hacer condiciones más avanzadas, también puedes comprobar más de una cosa. Por ejemplo, podríamos querer decir "si la temperatura de hoy es superior a 20 grados centígrados pero inferior a 30, imprima un mensaje".

let temp = 25

if temp > 20 {
    if temp < 30 {
        print("It's a nice day.")
    }
}

//Aunque eso funciona lo suficientemente bien, Swift proporciona una alternativa más corta: podemos usar && para combinar dos condiciones juntas, y toda la condición solo será verdadera si las dos partes dentro de la condición son 'true'.

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}

/*Deberías leer && como "y", por lo que todas nuestras condiciones dicen "si la temperatura es superior '>' a 20 y la temperatura es inferior '<' a 30, imprime un mensaje". Se llama operador lógico porque combina booleanos para hacer un nuevo booleano.

    && Tiene una contraparte que es de dos símbolos de tubería, ||, que significa "o". Mientras que && solo hará que una condición sea verdadera si ambas subcondiciones son verdaderas, || hará que una condición sea verdadera si cualquiera de las subcondiciones es verdadera.*/

let userAge = 14
let hasParentalConnsent = true

if userAge >= 18 || hasParentalConnsent == true {
    print("You can buy the game")
}
//Eso imprimirá "Puedes comprar el juego", porque aunque la primera mitad de nuestra condición 'false', el usuario no tiene al menos 18 años, la segunda mitad es 'true', porque tienen el consentimiento de los padres.


//Recuerde, el uso de '== true' en una condición se puede eliminar, porque obviamente ya estamos comprobando un booleano. Entonces, podríamos escribir esto en su lugar:
if userAge >= 18 || hasParentalConnsent {
    print("You can buy the game")
}


//Para terminar con la comprobación de múltiples condiciones, probemos un ejemplo más complejo que combina if, else if, else y || todo al mismo tiempo, e incluso muestra cómo las enumeraciones encajan en las condiciones.
enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane  // aqui le asignamos transport el valor de '.avion'

if transport == .airplane || transport == .helicopter {  // si una de las dos es verdadera será = true
    print("Let's fly!")
} else if transport == .bicycle { // si no esto.....
    print("I hope there's a bike path...")
} else if transport == .car {     // si no esto....
    print("Time to get stuck in traffic.")
} else {                         // y si no...
    print("I'm going to hire a scooter now!")
}


/// **Instruciones Switch**

//Puedes usar if y else if repetidamente para comprobar las condiciones tantas veces como quieras, pero se vuelve un poco difícil de leer. Por ejemplo, si tuviéramos un pronóstico del tiempo a partir de una 'enum', podríamos elegir qué mensaje imprimir en función de una serie de condiciones.

enum Weather {
    case sun, rain, wind, snow, unknown
}

let forecast = Weather.sun

if forecast == .sun {
    print("It should be a nice day.")
} else if forecast == .rain {
    print("Pack an umbrella.")
} else if forecast == .wind {
    print("Wear something warm")
} else if forecast == .rain {
    print("School is cancelled.")
} else {
    print("Our forecast generator is broken!")
}
/*Eso funciona, pero tiene problemas:
 1. Seguimos teniendo que escribir forecast, a pesar de que estamos comprobando lo mismo cada vez.
 2. Accidentalmente puse '.rain' dos veces, a pesar de que la segunda comprobación nunca puede ser cierta porque la segunda comprobación solo se realiza si la primera comprobación falló.
 
 3. No revisé '.snow' en absoluto, así que nos falta funcionalidad.*/

//Podemos resolver esos tres problemas usando una forma diferente de comprobar las condiciones llamada switch. Esto también nos permite comprobar los casos individuales uno por uno, pero ahora Swift puede ayudar. En el caso de una 'enum', conoce todos los casos posibles que la enumerada puede tener, por lo que si nos perdemos uno o revisamos uno dos veces, se quejará.

switch forecast {
case .sun:
    print("It should be a nice day.")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken")
}
//Swift ejecutará el primer caso que coincida con la condición que está comprobando.

/// *En primer lugar, sí, todas las declaraciones deben ser exhaustivas: debe asegurarse de que todos los valores posibles están cubiertos.

let place = "Metropolis"

switch place {
case "Gotham":
    print("You're Batman!")
case "Mega-City One":
    print("You're Judge Dredd!")
case "Wakanda":
    print("You're Black Panther!")
default:
    print("Who are you?")
}


//En primer lugar, así es como se vería el código sin fallthrough:
let day = 5
print("My true love gave to me…")

switch day {
case 5:
    print("5 golden rings")
case 4:
    print("4 calling birds")
case 3:
    print("3 French hens")
case 2:
    print("2 turtle doves")
default:
    print("A partridge in a pear tree")
}

//Podemos usar la 'fallthrough' con el codigo anterior:
let day2 = 5
print("My true love gave to me...")

switch day2 {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 French hens")
    fallthrough
case 2:
    print("2 turtles doves")
    fallthrough
default:
    print("A partridge in a  pear tree")
}
//si entra en la condicion del case, saltaria al siguente Case.


/// **TERNARIO CONDICIONAL**

let age3 =  18

//Creamos una constante llamada 'age3' que almacena la edad de alguien, y luego crear una segunda constante llamada 'canVote' que almacenará si esa persona puede votar o no.
let canVote = age3 >= 18 ? "Yes" : "No"

//Cuando se ejecute ese código, canVote se establecerá en "Sí" porque la edad se establece en 18 años.

let hour = 23
print(hour < 12 ? "It's before noon" : "It's after noon")

let name2 = ["Jayne", "Kaylee", "Mal"]
let crewCount = name2.isEmpty ? "No one" : "\(name.count) people"

print(crewCount)


enum Theme {
    case light, dark
}

let theme = Theme.dark
let background = theme == .dark ? "black" : "white"

print(background)

var hour2 = 23

print(hour2 < 12 ? "It's before noon" : "It's after noon")


//Si quisiéramos escribir eso usando si y de lo contrario, tendríamos que escribir este código no válido:
/*print(
    if hour2 < 12 {
        "It's before noon"
    } else {
        "It's after noon"
    }
)*/

if hour2 < 12 {
    print(" It's before noon")
} else {
    print("It's after noon")
}
