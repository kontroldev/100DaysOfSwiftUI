import Foundation


/// **Closures**

// Las funciones puedes pasar datos y devolverlos, pero tambien puedes asignarles variables, pasar funciones a funciones e incluso deolver funciones de funciones.
func greetUser() {
    print("Hi there")
}

greetUser()

var greetCopy = greetUser

/// *⚠️Importante: Cuando estás copiando una función, no escribas los paréntesis después de ella, es 'var greetCopy = greetUser' y no var greetCopy = greetUser(). Si pones los paréntesis allí, estás llamando a la función y asignando su valor de retorno a otra cosa.*

greetCopy

//Eso crea una función trivial y la llama, pero luego crea una copia de esa función y llama a la copia. Como resultado, imprimirá el mismo mensaje dos veces.


//¿y si quisieras omitir la creación de una función separada y simplemente asignar la funcionalidad directamente a una constante o variable? Bueno, resulta que tú también puedes hacer eso.

let sayHello = {
    print("Hi there!")
}

sayHello

//Si quieres que el 'closure' acepte parámetros, deben escribirse de una manera especial. Verás, el 'closures' comienza y termina con las llaves, lo que significa que no podemos poner código fuera de esas llaves para controlar los parámetros o devolver el valor. Por lo tanto, Swift tiene una solución adecuada: podemos poner esa misma información dentro de los aparatos ortopédicos.

let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

//Agreguegamos una palabra clave adicional aqui, es la palabra clave 'in', y viene directamente después de los parámetros y el tipo de retorno del cierre(Especificacion). Una vez más, con una función regular, los parámetros y el tipo de retorno saldrían de las llaves, pero no podemos hacer eso con los closures. Por lo tanto, 'in' se utiliza para marcar el final de los parámetros y el tipo de retorno, todo después de eso es el cuerpo del closure en sí.


//Tomemos la función greetUser() que escribimos antes: no acepta parámetros, no devuelve ningún valor y no lanza errores.
var greetCopy2: () -> Void = greetUser

/*Vamos a desglosar eso...
 
 1.Los paréntesis vacíos marcan una función que no toma parámetros.
 2.La flecha significa justo lo que significa al crear una función: estamos a punto de declarar el tipo de retorno de la función.
 3.'Void' significa "nada" - esta función no devuelve nada. A veces puedes ver esto escrito como (), pero generalmente lo evitamos porque se puede confundir con la lista de parámetros vacíos.*/

//El tipo de cada función depende de los datos que reciba y envíe de vuelta. Eso puede sonar simple, pero oculta una trampa importante: los nombres de los datos que recibe no forman parte del tipo de función.

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

//una función que acepta un entero y devuelve una cadena. Pero cuando tomamos una copia de la función, el tipo de función no incluye el nombre del parámetro externo, por lo que cuando se llama a la copia, usamos datos (1989) en lugar de datos (para: 1989).

let data: (Int) -> String = getUserData
let user = data(1989)
print(user)


sayHello2("Taylor")


let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]
let sortedTeam = team.sorted()

print(sortedTeam)

//'sorted()' en realidad nos permite pasar una función de clasificación personalizada para controlar exactamente eso. Esta función debe aceptar dos cadenas, y devolver 'true' si la primera cadena debe ordenarse antes de la segunda, o 'false' si la primera cadena debe ordenarse después de la segunda.
func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

/*si el primer nombre es 'Suzanne', devuelva 'true' para que el 'name1' esté ordenado antes del 'name2'. Por otro lado, si el 'name2' es Suzanne, devuelve false para que el 'name1' se ordene después del nombre2. Si ninguno de los nombres es Suzanne, solo usa < para hacer una clasificación alfabética normal.

 '.sorted()' se le puede pasar una función para crear un orden de clasificación personalizado, y siempre y cuando esa función a) acepte dos cadenas y b) devuelva un booleano, sorted()*/


//lo que hace nuestra nueva función captainFirstSorted(), para que podamos usarla de inmediato.
let captainFisrtTeam = team.sorted(by: captainFirstSorted)
print(captainFisrtTeam)

//Ahora cubriremos dos cosas aparentemente muy diferentes. En primer lugar, podemos crear closures como funciones anónimas, almacenándolos dentro de constantes y variables.
let sayHello3 = {
    print("Hi there!")
}

sayHello3()

/// *también podemos pasar funciones a otras funciones, al igual que pasamos captainFirstSorted() a sorted()*
let captainFirstTeam = team.sorted(by: captainFirstSorted)


//usamos un '.sorted()' en un closures.
let captainFirstTeam3 = team.sorted(by: {(name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
})


//MARK: - Pagina 2

/// ** Clousers finales y sintaxis abreviada

//En el código anterior(mas arriba ⬆️), la función que proporcionamos para ordenar '.sorted()' debe proporcionar dos cadenas y devolver un booleano.

//⚠️ No necesitamos especificar los tipos de nuestros dos parámetros porque deben ser 'String', y no necesitamos especificar un tipo de retorno porque debe ser un 'Bool'. Por lo tanto, podemos reescribir el código de esta manera:
let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

/*En lugar de pasar el closure como parámetro, simplemente seguimos adelante y comenzamos el closure directamente, y al hacerlo eliminamos, desde el principio,el paréntesis de closure al final.

Hay una última forma en que Swift puede hacer que los closures sean menos desordenados: puedes proporcionar automáticamente nombres de parámetros, utilizando la sintaxis abreviada. Con esta sintaxis, ya ni siquiera escribimos name1, name2, sino que dependemos de los valores con nombres especiales que Swift nos proporciona: $0 y $1, para la primera y la segunda cadena, respectivamente.*/

let captainFirstTeam4 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

//⚠️cuando una función acepta otra como su parámetro, como lo hace '.sorted()', Swift permite una sintaxis especial llamada sintaxis de cierre final.


/// *'in' se utiliza para marcar el final de los parámetros y el tipo de retorno, todo después de eso es el cuerpo del clouser en sí.*
let reverseTeam = team.sorted {
    return $0 > $1
}


//Ahora hemos cambiado la comparación de 'menos <' por el 'mayor >', así que obtenemos una clasificación inversa, pero ahora que estamos en una sola línea de código, podemos eliminar la devolución y reducirla a casi nada.
let reverseTeam2 = team.sorted { $0 > $1 }


//En primer lugar, la función filter() nos permite ejecutar algo de código en cada elemento de la 'array', y enviará de vuelta una nueva 'array' que contiene cada elemento que devuelva true para la función. Por lo tanto, podríamos encontrar a todos los jugadores del equipo cuyo nombre comience con T de esta manera:

let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

//Y en segundo lugar, la función '.map()' nos permite transformar cada elemento de la 'Array' utilizando algún código de nuestra elección, y envía de vuelta una nueva 'Array' de todos los elementos transformados:

let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

/*Eso imprimirá ["GLORIA", "SUZANNE", "PIPER", "TIFFANY", "TASHA"], porque ha en mayúsculas todos los nombres y ha producido una nueva matriz a partir del resultado.
 
 Consejo: Cuando se trabaja con map(), el tipo que devuelve no tiene que ser el mismo que el tipo con el que comenzó; podría convertir una matriz de enteros en una matriz de cadenas, por ejemplo.*/


//MARK: - Pagina 3

/// **Funciones como parametro**

//Hay un último tema relacionado con el 'closures' que quiero ver, que es cómo escribir funciones que aceptan otras funciones como parámetros. Esto es particularmente importante para los 'closures' debido a la sintaxis de cierre final, pero es una habilidad útil para tener a pesar de todo.

func greetUser3() {
    print("Hi there!")
}

greetUser3()

var greetCopy3: () -> Void = greetUser3
greetCopy3


func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()
    
    for _ in 0..<size {
        let newNumber = generator()
        numbers.append(newNumber)
    }
    return numbers
}
/*Vamos a desglosar eso 👆
 
 1. La función se llama 'makeArray()'. Toma dos parámetros, uno de los cuales es el número de enteros que queremos, y también devuelve una 'Array' de 'Int'.
 2. El segundo parámetro es una función. Esto no acepta ningún parámetro en sí, pero devolverá un 'Int' cada vez que se llame.
 3. Dentro de makeArray() creamos una nueva 'Array' vacío de 'Int', luego hacemos un bucle tantas veces como se solicite.
 4. Cada vez que el bucle da la vuelta, llamamos a la función del 'generador' que se pasó como parámetro. Esto devolverá un nuevo 'Int', por lo que lo ponemos en la 'Array' de números.
 5. Finalmente, se devuelve la matriz.*/


//El cuerpo del makeArray() es en su mayoría sencillo: llame repetidamente a una función para generar un entero, agregando cada valor a una matriz y luego envíelo todo de vuelta.


//El resultado es que ahora podemos hacer 'Array' enteras de tamaño arbitrario, pasando una función que debería usarse para generar cada número.
let rolls = makeArray(size: 50) {
    Int.random(in: 1...20)
}

print(rolls)

//Y recuerda, esta misma funcionalidad también funciona con funciones dedicadas, por lo que podríamos escribir algo como esto.

func generateNumber() -> Int {
    Int.random(in: 1...20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

/*Puede hacer que su función acepte múltiples parámetros de función si lo desea, en cuyo caso puede especificar varios closures finales. La sintaxis aquí es muy común en SwiftUI, por lo que es importante al menos mostrarte una muestra de ella aquí.
 
 Para demostrar esto, aquí hay una función que acepta tres parámetros de función, cada uno de los cuales no acepta parámetros y no devuelve nada:*/

func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("Abount to start first work")
    first()
    print("Abount to start second work")
    second()
    print("Abount to start thrird work")
    third()
    print("Done!")
}

//Cuando se trata de llamar a eso, el primer cierre final es idéntico a lo que ya hemos usado, pero el segundo y el tercero tienen un formato diferente: terminas la llave del cierre anterior, luego escribes el nombre del parámetro externo y los dos puntos, y luego comienzas otra llave.

doImportantWork {
    print("This is the first work")
} second: {
    print("This is the second work")
} third: {
    print("This is the third work")
}

//Tener tres cierres finales no es tan raro como cabría esperar. Por ejemplo, hacer una sección de contenido en SwiftUI se hace con tres cierres finales: uno para el contenido en sí, uno para un encabezado que se pondrá arriba y otro para un pie de página que se pondrá abajo.


/// **Punto de control 5
 
let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

// Filtrar números pares, luego ordenar y mapear a String
luckyNumbers
    .filter { $0 % 2 == 1 } // Filtra números impares (resto de división por 2 es 1)
    .sorted() // Ordena los números filtrados en orden ascendente
    .map { "\($0) is a lucky number" } // Mapea cada número a la cadena deseada

    // Imprime cada elemento de la Array restante en una línea
    .forEach { print($0) }

