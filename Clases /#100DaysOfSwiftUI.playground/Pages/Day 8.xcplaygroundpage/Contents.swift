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
do {
    try someRiskyWork()
} catch {
    print("Handle error here")
}

// Si quisiéramos escribir, prueba eso usando nuestra función actual checkPassword(), podríamos escribir esto.
let string = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating: \(result)")
} catch {
    print("There was an error.")
}

//Si la función checkPassword() funciona correctamente, devolverá un valor en el resultado, que luego se imprimirá. Pero si se produce algún error (que en este caso habrá), el mensaje de clasificación de la contraseña nunca se imprimirá; la ejecución saltará inmediatamente al bloque de captura.

//Cuando usas try, necesitas estar dentro de un bloque de 'do', y asegurarte de tener uno o más bloques de captura capaces de manejar cualquier error. ¡En algunas circunstancias puedes usar una alternativa escrita como prueba! Que no requiere hacer y atrapar, pero bloqueará su código si se lanza un error - debe usar esto rara vez, y solo si está absolutamente seguro de que no se puede lanzar un error.

let string2 = "12345"

do {
    let result = try checkPassword(string)
    print("Password rating")
} catch PasswordError.short +´
