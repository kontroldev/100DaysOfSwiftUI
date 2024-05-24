import Foundation


/// **MANEJAR DATOS EN OPCIONALES**

/// *1.Concepto de Opcionales:

// -Un opcional puede contener un valor o ser nil, representado con un signo de interrogación (?) después del tipo de dato (e.g., String?).


/// *2.*Uso de Diccionarios y Opcionales:

// - Al intentar acceder a un valor en un diccionario con una clave inexistente, el resultado es un opcional nil.

/*let opposites = ["Mario": "Wario", "Luigi": "Waluigi"]
let peachOpposite = opposites["Peach"] // Resultado: nil*/


/// *3.Desenvolver Opcionales:

// -Para utilizar el valor de un opcional, se debe desenvolver. Swift proporciona varias formas para hacerlo, siendo if let la más común.

/*if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}*/


/// *4.Propiedades de los Opcionales:

// - Un opcional es como una caja que puede estar vacía (nil) o contener un valor.
// - Se usan para asegurar que el código solo opere con valores válidos.


/// *5.Comparación con Valores No Opcionales:

// - Un entero no opcional (Int) siempre tiene un valor, mientras que un opcional (Int?) puede no tenerlo.

//var number: Int? = nil


/// *6.Manejo de Opcionales con guard let:

// - Otra forma de desenvolver opcionales es usando guard let, que proporciona una salida temprana si el opcional es nil.

/*func square(number: Int?) -> Int {
    guard let number = number else {
        return 0
    }
    return number * number
}*/


/// *7.Desenvolvimiento Implícito:

// - En algunos casos, se puede forzar el desenvolvimiento con !, pero esto debe hacerse con precaución, ya que si el valor es nil, el programa fallará.

// Diccionario de opuestos
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

// Acceso a una clave inexistente, resultando en un opcional nil
let peachOpposite: String? = opposites["Peach"]

// Ejemplo de if let para desenvolver opcionales
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
} else {
    print("No opposite found for Mario")
}

// Ejemplo de guard let para envolver opcionales
func square(number: Int?) -> Int {
    guard let number = number else {
        print("No number provided")
        return 0
    }
    return number * number
}

// Uso de la función con un opcional nil y un valor
var optionalNumber: Int? = nil
print(square(number: optionalNumber)) // Output: No number provided 0

optionalNumber = 5
print(square(number: optionalNumber)) // Output: 25

// Ejemplo de opcional implícitamente desenvuelto
var implicitlyUnwrappedOptional: String = "Hello"
print(implicitlyUnwrappedOptional) // Output: Hello

// Si el opcional implícitamente desenvuelto se establece en nil, causará un error en tiempo de ejecución
// implicitlyUnwrappedOptional = nil
// print(implicitlyUnwrappedOptional) // Esto fallará si se descomenta


// Si el opcional implícitamente desenvuelto se establece en nil, causará un error en tiempo de ejecución
// implicitlyUnwrappedOptional = nil
// print(implicitlyUnwrappedOptional) // Esto fallará si se descomenta
/*Este conjunto de ejemplos cubre las principales formas de trabajar con opcionales en Swift, asegurando que el código sea seguro y predecible. Utiliza if let y guard let para desenvolver opcionales de manera segura y evita el uso imprudente de opcionales implícitamente desenvueltos (!).*/


//MARK: - Pagina 2

/// **DEVOLVER OPCIONALES CON GUARD**

// -Diferencias entre if let y guard let:

// - if let: Corre el código dentro de sus llaves si el opcional tiene un valor.
// - guard let: Corre el código dentro de sus llaves si el opcional no tiene un valor, requiriendo siempre un return si la verificación falla.

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }
    print("\(number) x \(number) is \(number * number)")
}

// Ejemplo de uso:
var myVar: Int? = 3

// Ejemplo con 'if let'
if let unwrapped = myVar {
    print("Run if myVar has a value inside")
} else {
    print("Run if myVar doesn't have a value inside")
}

// Ejemplo con 'guard let'
func checkMyVar() {
    guard let unwrapped = myVar else {
        print("Run if myVar doesn't have a value inside")
        return
    }
    print("Run if myVar has a value inside")
}

checkMyVar()

/// *1. Función printSquare(of:):

// - La función recibe un parámetro opcional number de tipo Int?.
// - Usa guard let para desenvolver number.
// - Si number es nil, imprime "Missing input" y retorna.
// - Si number tiene un valor, imprime el cuadrado del número.


/// *2. Ejemplo de uso con myVar:

// - Se declara myVar como un opcional de tipo Int con valor 3.
// - if let se usa para verificar y desenvolver myVar si tiene un valor.
// - guard let se usa para verificar myVar y ejecuta el bloque else si no tiene un valor, asegurando una salida temprana.


/// *3.Beneficios de guard let:

// - Facilita el manejo de errores al inicio de una función.
// - Asegura que todas las entradas son válidas antes de proceder.
// - Permite usar el valor desenvuelto fuera del bloque guard.
// - Este enfoque mejora la legibilidad y la robustez del código, manejando errores de forma temprana y clara.

//MARK: - Pagina 3

/// **OPCIONALES DE COALESCENCIA NULA**

// Ejemplo con diccionarios
let captains = [
    "Enterprise": "Picard",
    "Voyager": "Janeway",
    "Defiant": "Sisko"
]
let new = captains["Serenity"] ?? "N/A"
print(new) // Output: "N/A"

// Ejemplo con arrays
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"
print(favorite) // Output: Puede ser uno de los shows o "None"

// Ejemplo con estructuras
struct Book {
    let title: String
    let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author) // Output: "Anonymous"

// Ejemplo de conversión de String a Int
let input = ""
let number = Int(input) ?? 0
print(number) // Output: 0


/// *1.Uso con Diccionarios:

// - Se accede a un valor en un diccionario usando una clave.
// - Si la clave no existe, se devuelve un valor predeterminado.
// - Ejemplo: new obtendrá "N/A" porque "Serenity" no es una clave en captains.


/// *2.Uso con Arrays:

// - Se obtiene un elemento aleatorio de un array usando randomElement().
// - 'randomElement()' devuelve un opcional porque el array puede estar vacío.
// - Se usa ?? para proporcionar "None" si el array está vacío.


/// *3.Uso con Estructuras:

// - Una estructura Book tiene una propiedad opcional author.
// - Si author es nil, se devuelve "Anonymous".
// - Esto asegura que siempre haya un valor para author al imprimirlo.


/// *4.Conversión de String a Int:

// - Intentar convertir un string vacío a un entero devuelve nil.
// - Usando ??, se proporciona 0 como valor predeterminado si la conversión falla.
// - Este operador es muy versátil y se puede utilizar en cualquier lugar donde haya opcionales, proporcionando siempre una forma segura de manejar valores nil y garantizando que las variables tengan valores utilizables.


//MARK: - Pagina 4
/// **Multiples opcionales**

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")

struct Book1 {
    let title: String
    let author: String?
}

var book2: Book1? = nil
let author1 = book2?.author?.first?.uppercased() ?? "A"
print(author)


/// **Explicación

/// *1.Array y Elemento Aleatorio:

// - let names = ["Arya", "Bran", "Robb", "Sansa"]: Crea un array de nombres.
// - let chosen = names.randomElement()?.uppercased() ?? "No one": Intenta obtener un elemento aleatorio y convertirlo a mayúsculas; si no hay elementos, asigna "No one".
// - print("Next in line: \(chosen)"): Imprime el resultado.


/// *2.Estructura Book y Encadenamiento:

// - struct Book { let title: String; let author: String? }: Define la estructura Book con propiedades title y author.
// - var book: Book? = nil: Crea una variable opcional book que inicialmente es nil.
// - let author = book?.author?.first?.uppercased() ?? "A": Intenta acceder al autor, la primera letra y convertirla a mayúsculas; si falla, asigna "A".
// - print(author): Imprime el resultado.
// - Este uso del encadenamiento opcional permite manejar de manera eficiente múltiples niveles de opcionales en Swift, reduciendo la necesidad de múltiples verificaciones de nil y simplificando el flujo del código.
