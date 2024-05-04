import Foundation

/// **Bucles for
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works great on \(os).")
}
//El bucle pasa para todos los elementos en las plataformas, poniéndolos uno por uno en una "variable" 'os'.
//No hemos creado 'os' en otro lugar; se ha creado solo para el ambito, como parte del bucle y solo está disponible dentro de los soportes de apertura y cierre.


//Decir que el nombre 'os' no es especial, podríamos haber escrito un nombre mas concreto o descriptivo.
for name in platforms {
    print("Swift works great on \(name).")
}


/// **Bucle con operadores de rango.

for i in 1...12 {
    print("5 x \(i) is \(5 * 1)")
}

//Swift tiene un tipo de rango similar pero diferente que cuenta hasta pero excluyendo el número final: .. <. Esto se ve mejor en el código.
for i in 1...5 {
    print("Counting form 1 through 5: \(i)")
}

print()

for i in 1..<5 {
    print("Counting 1 up to 5: \(i)")
}

/// *Consejo: '..<' es muy útil para trabajar con matrices, donde contamos desde 0 y a menudo queremos contar hasta el ultimo.

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)


/// **Bucles while**
//Swift tiene un segundo tipo de bucle llamado while: proporcionarle una condición, y el bucle while se ejecutará continuamente el ambito del bucle hasta que la condición sea falsa.

//Aunque todavía verás bucles while de vez en cuando, no son tan comunes como los bucles.
var countdown = 10

while countdown > 0 {
    print("\(countdown)...")
    countdown -= 1
}

print("Blas off!!")
//Esto crea un contador de enteros a partir de 10, luego comienza un bucle while con la condición de cuenta atrás > 0. Por lo tanto, el cuerpo del bucle, imprimiendo el número y restando 1, se ejecutará continuamente hasta que la cuenta atrás sea igual o inferior a 0, momento en el que el bucle terminará y se imprimirá el mensaje final.

/// *Mientras que los bucles son realmente útiles cuando simplemente no sabes cuántas veces se dará la vuelta al bucle. Para demostrar esto, quiero presentarte una funcionalidad realmente útil que tanto Int como Double tienen: random(in:). Dale un rango de números con los que trabajar, y te devolverá un Int o Double aleatorio en algún lugar dentro de ese rango.

// Esto crea un 'Int' entre 1...1000
let id = Int.random(in: 1...1000)

//Y esto crea un decimal aleatorio entre 0 y 1.
let amount = Double.random(in: 0...1)


/*Ejercicio: Podemos usar esta funcionalidad de un bucle de tiempo para lanzar algunos dados virtuales de 20 lados, una y otra vez, terminando el bucle solo cuando se lanza un 20*/

/// Crear un número entero para almacenar nuestro rol.
var rol = 0

//Continúa haciendo bucles hasta que lleguemos a los 20.
while rol != 20 {  // mientras que rol no sea igual a 20.
    rol = Int.random(in: 1...20) //Tira un nuevo dado e imprime lo que era
    print("I rolled a \(rol)")
}

//Si estamos aquí, significa que el bucle terminó, ¡tenemos un 20!
print("Critical hit!")


/// **Bucles, Break y continue**

/// *Swift nos da dos formas de omitir uno o más elementos en un bucle: 'continue' omite la iteración de bucle actual y 'break' omite todas las iteraciones restantes. Como los bucles while, estos a veces se usan, pero en la práctica mucho menos de lo que podrías pensar.

/// *Continue*
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
    print("Found pictures: \(filename)")
}
//Eso crea una 'array' de cadenas de nombres de archivo, luego pasa por encima de cada una y comprueba que tiene el sufijo ".jpg" - que es una imagen, y cuando llega a una con ese sufijo, deja de evaluar mas condiciones y sale del bucle con 'continue'

/// *Break

//En cuanto al break, eso sale de un bucle inmediatamente y omite todas las iteraciones restantes. Para demostrar esto, podríamos escribir algún código para calcular 10 múltiplos comunes para dos números:
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
    if i.isMultiple(of: number1) && i.isMultiple(of: number2) {
        multiples.append(i)
        
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)

/*Eso hace mucho:
 
 1.Crea dos constantes para almacenar dos números.
 2.Crea una variable de 'array' de enteros que almacene los dos valores de números.
 3.Cuenta de 1 a 100.000, asignando cada variable de bucle a i.
 4.Si i es un múltiplo del primer y segundo número, añádelo a la matriz entera.
 5.Una vez que lleguemos a 10 múltiplos, llame a la interrupción para salir del bucle.
 6.Imprima la array resultante.
*/
