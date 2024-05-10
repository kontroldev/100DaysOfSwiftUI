import Foundation

/// **ESTRUCTURAS**

/*Las estructuras de Swift nos permiten crear nuestros propios tipos de datos personalizados y complejos, completos con sus propias variables y sus propias funciones.

Una estructura simple se ve así:*/

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary() {
        print("\(title) (\(year)) by \(artist)")
    }
}

//Observamos cómo podemos crear un nuevo álbum como si estamos llamando a una función; solo necesitamos proporcionar valores para cada una de las constantes en el orden en que se definieron.


//El álbum es como String o Int: podemos asignar valores, copiarlos, etc. Por ejemplo, podríamos hacer un par de álbumes, luego imprimir algunos de sus valores y llamar a sus funciones:
let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title)
print(wings.artist)

red.printSummary()
wings.printSummary()

//Observe cómo podemos crear un nuevo álbum como si estuviéramos llamando a una función; solo necesitamos proporcionar valores para cada una de las constantes en el orden en que se definieron.

//Donde las cosas se ponen más interesantes es cuando quieres tener valores que puedan cambiar. Por ejemplo, podríamos crear una estructura para empleados que pueda tomar vacaciones según sea necesario:

struct Employee {
    let name: String
    var vacationRemaining = 14
    
   mutating func takeVacation(days: Int) {
        if vacationRemaining > days {
            vacationRemaining -= days //El operador mutante no es mutable: el "yo" es inmutable, y por eso debemos de poner en la funcion 'mutating
            print("I'm going on vacation!")
            print("Days remaining: \(vacationRemaining)")
        } else {
            print("Oops! There aren't enough days remaing")
        }
    }
}
//si creamos un empleado como una constante usando let, Swift hace que el empleado y todos sus datos sean constantes: podemos llamar a las funciones bien, pero no se debería permitir que esas funciones cambien los datos de la estructura porque lo hicimos constante.

// 👇este código se construirá bien, pero Swift nos evitará llamar a takeVacation() desde estructuras constantes.
var archer = Employee(name: "Sterling Archer", vacationRemaining: 14)

archer.takeVacation(days: 5)
print(archer.vacationRemaining)

/*Vamos a explorar las estructuras en detalle en los próximos capítulos, pero primero quiero dar algunos nombres a las cosas.
 
 1. Las variables y constantes que pertenecen a las estructuras se llaman propiedades.
 2. Las funciones que pertenecen a las estructuras se denominan métodos.
 3. Cuando creamos una constante o variable a partir de una estructura, lo llamamos una instancia: podría crear una docena de instancias únicas de la estructura del Album, por ejemplo.
 4. Cuando creamos instancias de estructuras, lo hacemos usando un inicializador como este: Album(title: "Wings", artist: "BTS", year: 2016).*/


// estamos tratando nuestra estructura como una función y pasando parámetros.
var archer1 = Employee(name: "Sterling Archer", vacationRemaining: 14)
var archer2 = Employee.init(name: "Sterling Archer", vacationRemaining: 14)

//Cuando introducimos 'Double' por primera vez, no se puede agregar un 'Int' y un 'Double' y en su lugar necesitas escribir un código como este:
let a = 1
let b = 2.0
let c = Double(a) + b


//si nuestra estructura tuviera estas dos propiedades
let name: String
var vacationRemaining = 14

//Swift generará un inicializador con un valor predeterminado de 14 para vacationRemaining, lo que hará que ambos sean válidos:

let kane = Employee(name: "Lana Kane")
let poovey = Employee(name: "Pam Poovey", vacationRemaining: 35)

/// *Consejo: Si asigna un valor predeterminado a una propiedad constante, se eliminará por completo del inicializador. Para asignar un valor predeterminado, pero dejar abierta la posibilidad de anularlo cuando sea necesario, utilice una propiedad variable.*


//MARK: - Paginas 2

/// **CALCULAR VALORES DE LAS PROPIEDADES**

struct Employee2 {
    let name2: String
    var vacationAllocated = 14
    var vacationTaken = 0
    
    var vacationRemaining2: Int {
        get {
            vacationAllocated - vacationTaken
        }
        set {
            vacationAllocated = vacationTaken + newValue
        }
    }
}


var archer3 = Employee2(name2: "Sterling Archer", vacationAllocated: 14)
    
    archer3.vacationTaken += 4
    archer3.vacationRemaining2 = 5
print(archer3.vacationAllocated)


//Las estructuras pueden tener dos tipos de propiedades: una propiedad almacenada es una variable o constante que contiene un dato dentro de una instancia de la estructura, y una propiedad calculada, calcula el valor de la propiedad dinámicamente cada vez que se accede a ella. Esto significa que las propiedades calculadas son una mezcla de propiedades y funciones almacenadas: se accede a ellas como propiedades almacenadas, pero funcionan como funciones.


/// *Como ejemplo, anteriormente teníamos una estructura de empleado que podía hacer un seguimiento de cuántos días de vacaciones quedaban para ese empleado.(el codigo esta mas arriba)

//Podríamos ajustar esto para usar la propiedad computada, así:
   
    
        //Ahora, en lugar de hacer vacaciones, que sigue siendo algo a lo que podemos asignar directamente, se calcula restando la cantidad de vacaciones que han tomado de la cantidad de vacaciones que se les asignó.

//Cuando estamos leyendo de 'vacationRemaining', parece una propiedad almacenada normal:

//En este caso, el getter es lo suficientemente simple, porque es solo nuestro código existente. Pero el setter es más interesante: si estableces la permanencia de vacaciones para un empleado, ¿quieres decir que quieres que se aumente o disminuya el valor asignado de sus vacaciones, o si las vacaciones asignadas deberían seguir siendo las mismas y en su lugar cambiamos las vacaciones?



//MARK: - Pagina 3

/// **MEDIAS CUANDO LA PROPIEDAD CAMBIA**

struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1

struct App {
    var contacts = [String]() {
        willSet {
            print("Current value is \(contacts)")
            print("New value will be \(newValue)")
        }
        didSet {
            print("There are now \(contacts.count) contacts.")
            print("Old value was \(oldValue)")
        }
    }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


//MARK: - Pagina 4

/// **COMO CREAR INICIALIZADORES**

struct Player {
    let name: String
    let number: Int
    
    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}

let player = Player(name: "Megan R")
print(player.number)
