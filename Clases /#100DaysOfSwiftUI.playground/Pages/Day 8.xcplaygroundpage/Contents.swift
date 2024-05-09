import Foundation

//MARK: - Pagina 1
/// **VALORES PREDETERMINADOS**

//Agregar parámetros a las funciones nos permite agregar puntos de personalización, para que las funciones puedan operar con diferentes datos dependiendo de nuestras necesidades. A veces queremos que estos puntos de personalización estén disponibles para mantener nuestro código flexible, pero otras veces no quieres pensar en ello, quieres lo mismo nueve de cada diez veces.

//Por ejemplo, anteriormente vimos esta función:
func printTimesTables(for number: Int, end: Int) {
    for i in 1...end {     // comienza con el numero 1, hasta el infinito.
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5, end: 20)

//
func printTimesTables2(for number: Int, end: Int = 12) {
    for i in 1...end {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables2(for: 5, end: 20)
printTimesTables2(for: 8)



var characters = ["Lana", "Pam", "Ray", "Sterling"]
print(characters.count)

characters.removeAll()
print(characters.count)


characters.removeAll(keepingCapacity: true)


//MARK: - Pagina 2

enum PasswordError: Error {
    case short, obvious
}


func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    if password == "12345" {
        throw PasswordError.obvious
    }
    if password.count < 8 {
        return "OK"
    } else if password.count < 10 {
        return "Good"
    } else {
        return "Excellent"
    }
}

/*Vamos a desglosar eso...
 
 If a function is able to throw errors without handling them itself, you must mark the function as throws before the return type.
 No especificamos exactamente qué tipo de error lanza la función, solo que puede generar errores.
 Being marked with throws does not mean the function must throw errors, only that it might.
 When it comes time to throw an error, we write throw followed by one of our PasswordError cases. This immediately exits the function, meaning that it won’t return a string.
 Si no se lanzan errores, la función debe comportarse como de costumbre: debe devolver una cadena.*/


/*El paso final es ejecutar la función y manejar cualquier error que pueda ocurrir. Los Swift Playgrounds son bastante laxos con el manejo de errores porque están destinados principalmente al aprendizaje, pero cuando se trata de trabajar con proyectos reales de Swift, encontrarás que hay tres pasos:
 
 Iniciando un bloque de trabajo que podría lanzar errores, usando do.
 Llamar a una o más funciones de lanzamiento, usando try.
 Manejar cualquier error lanzado usando catch.*/

// Enpseudocodigo se ve asi: 👇
/*do {
    try someRiskyWork()
} catch {
    print("Handle error here")
}*/

// Si quisiéramos escribir, usando nuestra función actual checkPassword(), podríamos escribir esto.
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

//Si la función checkPassword() funciona correctamente, devolverá un valor en el resultado, que luego imprimirá. Pero si se produce algún error (que en este caso habrá), el mensaje de clasificación de la contraseña nunca se imprimirá; la ejecución saltará inmediatamente al bloque de captura.

//Cuando usas try, necesitas estar dentro de un bloque to 'do', y asegurarte de tener uno o más bloques de captura capaces de manejar cualquier error. ¡En algunas circunstancias puedes usar una alternativa escrita como 'try!' Que no requiere hacer y capturar, pero bloqueará su código si se lanza un error - debe usar esto rara vez, y solo si está absolutamente seguro de que no se puede lanzar un error.

/// *Cuando se trata de detectar errores, siempre debe tener un bloque de captura que sea capaz de manejar todo tipo de errores. Sin embargo, también puedes detectar errores específicos.*
///
let string2 = "12345"

do {
    let result2 = try checkPassword(string)
    print("Password rating \(result2)")
          } catch PasswordError.short {
        print("Please use a longer password")
    } catch PasswordError.obvious {
        print("I have the same combination on my luggage!")
    } catch {
        print("The was an error.")
    }

/// *Consejo: La mayoría de los errores lanzados por Apple proporcionan un mensaje significativo que puede presentar a su usuario si es necesario. Swift hace que esto esté disponible utilizando un valor de error que se proporciona automáticamente dentro de su bloque de captura, y es común leer error.localizedDescription para ver exactamente lo que sucedió.*

//MRAK: - Checkpoint 4

enum ErrorDeRaizCuadrada: Error {
    case fueraDeRango
    case sinRaiz
}

func raizCuadradaEntera(_ numero: Int) throws -> Int {
    guard (1...10_000).contains(numero) else {
        throw ErrorDeRaizCuadrada.fueraDeRango
    }
    
    guard numero >= 0 else {
        throw ErrorDeRaizCuadrada.sinRaiz
    }
    
    var bajo = 0
    var alto = numero
    
    while bajo <= alto {
        let medio = (bajo + alto) / 2
        let cuadrado = medio * medio
        
        if cuadrado == numero {
            return medio
        } else if cuadrado < numero {
            bajo = medio + 1
        } else {
            alto = medio - 1
        }
    }
    
    throw ErrorDeRaizCuadrada.sinRaiz
}

// Ejemplo
do {
    let resultado = try raizCuadradaEntera(25) // Esto devolverá 5
    print("Raíz cuadrada: \(resultado)")
    
    let resultado2 = try raizCuadradaEntera(17) // Esto lanzará un error sinRaiz
    print("Raíz cuadrada: \(resultado2)")
    
    let resultado3 = try raizCuadradaEntera(10001) // Esto lanzará un error fueraDeRango
    print("Raíz cuadrada: \(resultado3)")
} catch let error {
    print("Error: \(error)")
}

