import Foundation

/// **Tipos de datos**

/// *Swift es capaz de averiguar qué tipo de datos tiene una constante o variable en función de lo que le asignamos. Sin embargo, a veces no queremos asignar un valor de inmediato, o a veces queremos dejar vacio y no le asignamos un valor, y ahí es donde entran en anotaciones de tipo.

let surname = "Lasso"
var score = 0
//Esto utiliza la inferencia de tipo: Swift infiere que 'surname' es una cadena porque le estamos asignando texto, y luego infiere que 'score' es un entero porque le estamos asignando un número entero.


//Los tipos de datos nos permiten ser explícitos sobre qué tipos de datos queremos.
let surname2: String = "Lasso"
var score2: Int = 0

//Ahora estamos siendo explícitos: 'surname' debe ser un 'String' y 'score' debe ser un Int. Eso es la inferencia de tipo de Swift.

//por ejemplo, tal vez la puntuación sea un decimal porque el usuario puede obtener medio punto, así que escribiremos:
var score3: Double = 0

//👆Sin los ': Double', Swift inferiría que es un entero, pero estamos anulando eso y diciendo que definitivamente es un número decimal.


/// *Hemos analizado algunos tipos de datos hasta ahora, y es importante que conozcas sus nombres para que puedas usar la inferencia de tipo correcta cuando sea necesario.

// 'String' contiene texto
let playerName: String = "Roy"

// 'Int' numeros enteros
var luckyNumber: Int = 13

// 'Double' numeros decimales
let pi: Double = 3.141

// 'Booleano' verdadero o falso
var isAuthenticated: Bool = true


/// *Un 'Array' tiene muchos valores diferentes, todos en el orden en que los agregas. Esto debe ser especializado, como [String]
var albums: [String] = ["Red", "Fearless"]

/// *Un 'Dictionary' tiene muchos valores diferentes, donde se puede decidir cómo se debe acceder a los datos. Esto debe ser especializado, como [String: Int] [calve: valor]
var user: [String: String] = ["id": "@twostraws"]

/// *Los 'Set' contiene muchos valores diferentes, pero los almacena en un orden que está optimizado para comprobar lo que contiene. Esto debe ser especializado, como Set<String>:
var books: Set<String> = Set(["The bluest Eye", "Foundation", "Girl, Woman, Other"])


//Conocer todos estos tipos es importante para depende que momentos en los que no quieres proporcionar valores iniciales. Por ejemplo, esto crea una matriz de cadenas:
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]


/// *No se necesita una onferencia de tipo aqui, porque Swift puede ver que estás asignando una matriz de cadenas. Sin embargo, si quisieras crear una matriz vacía de 'String', necesitarías saber el tipo:
var cities:  [String] = [String]()

/// **Diferencias de constructor del tipo y inferencia del tipo.

/// **Constructor del Tipo
/// *La anotación del tipo implica que declaras explícitamente el tipo de una variable al momento de su definición. Esto se hace utilizando dos puntos seguido del tipo deseado.
///
// ⚠️Tambien podemos hacer una anotacion del tipo de 'String' vacia.
var cities2: [String] = []

/// **Inferencia del Tipo
/// *La inferencia del tipo permite que el compilador determine automáticamente el tipo de una variable en función del valor que se le asigna en la inicialización. En Swift, el compilador puede deducir el tipo de forma automática sin necesidad de una anotación explícita.

var clues = [String]() // ⚠️Recuerda, de agregar los paréntesis abiertos y cerrados al hacer 'Arrays', 'Diccionarios' y 'Set' vacíos.



/// **enum**
/// *Los 'enum'(abreviatura de enumeración) es un tipo de datos que te permite definir un grupo de valores relacionados. Un enum define un conjunto de opciones o casos posibles, donde cada caso representa un valor distinto dentro de ese conjunto. Los enums son útiles cuando quieres representar un conjunto fijo de opciones o estados dentro de tu código.*

enum UIStyle {
    case light, dark, system
}

var style = UIStyle.light


//La excepción más común a esto es con las constantes para las que aún no tengan valor. Swift es realmente inteligente: puedes crear una constante que aún no tiene un valor, más tarde proporciona ese valor, y Swift se asegurará de que no la usemos accidentalmente hasta que haya un valor presente. También se asegurará de que solo establezca el valor una vez, para que permanezca constante.
let username: String

username = "@twostrws"

print(username)
/*Ese código es legal: estamos diciendo que el nombre de usuario contendrá una cadena en algún momento, y proporcionamos un valor antes de usarlo. Si faltaba la línea de asignación - nombre de usuario = "@twostraws" -, entonces Swift se negaría a construir nuestro código porque el nombre de usuario no tendría un valor, y de manera similar, si intentáramos establecer un valor para el nombre de usuario por segunda vez, Swift también se quejaría.

Este tipo de código requiere una anotación de tipo, porque sin que se le asigne un valor inicial, Swift no sabe qué tipo de nombre de usuario de datos contendrá.

Independientemente de si usa inferencia de tipo o anotación de tipo, hay una regla de oro: Swift debe saber en todo momento qué tipos de datos contienen sus constantes y variables. Esto está en el centro de ser un lenguaje seguro para el tipo, y nos impide hacer cosas sin sentido como 5 + verdaderas o similares.*/


//En resumen, los enums en Swift son una poderosa herramienta para modelar datos que tienen un conjunto fijo de valores posibles. Permiten escribir un código más claro, seguro y fácil de mantener al representar de manera explícita las opciones disponibles en tu programa. Los enums son comúnmente utilizados para representar estados, opciones, categorías, y más en una aplicación Swift.


/// **Importante👇: Aunque la anotación de tipo puede permitirnos anular la inferencia de tipo de Swift hasta cierto punto, nuestro código terminado aún debe ser posible. Por ejemplo, esto no está permitido:**

//let score4: Int = "Zero" //Swift simplemente no puede convertir "Zero" en un entero para nosotros, incluso con una anotación de tipo que lo solicitamos, por lo que el código simplemente no se compilará.



/// **EJERCICIOS**
/// Esta vez, el desafío es crear una 'Array' de 'String', luego escribir algo de código que imprima el número de elementos en la 'String' y también el número de elementos únicos en la matriz.

let albums3 = ["Red", "Fearless", "Speak Now", "Red", "1989", "Fearless"] // Aqui creamos una 'Array' de 'Strings

let totalElements = albums3.count //Aqui asignamos 'totalElements' y le decimos que cuente los numeros de elementos que hay en la 'array' con el '.count'

print("Número total de elementos en la matriz: \(totalElements)") // Aqui interpolamos el numero de elementos que tiene una 'Array'
