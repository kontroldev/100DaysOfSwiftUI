import Foundation

/// **INTRODUCCION A LAS CLASES**

// -Las clases, son plantillas para crear objetos que combinan datos y funcionalidad.

// -A diferencia de las estructuras, las clases permiten la herencia, lo que significa que una clase puede derivar de otra y heredar sus propiedades y métodos.

/// *Definición de una Clase:

// -Se muestra cómo definir una clase básica usando la palabra clave 'class' con miniscula.

class Car {
    var model: String
    var numberOfSeats: Int
    var currentGear: Int
    
    init(model: String, numberOfSeats: Int, currentGear: Int) {
        self.model = model
        self.numberOfSeats = numberOfSeats
        self.currentGear = currentGear
    }
    
    func changeGear(up: Bool) {
        if up {
            currentGear += 1
        } else {
            currentGear -= 1
        }
    }
}

//la clase 'Car' tiene propiedades como 'model', 'numberOfseats', 'currentGear', y un metodo 'chargeGear' para cambiar de marcha.


/// **INICIALIZADORES**
// - Los inicializadores 'init' configuran las nuevas instancias de la clase con los valores iniciales
// - Los inicializadores aseguran que todas las propiedades de una clase tenga un valor antes que se use una instancia.


/// **HERENCIA**
// - Se aborda la herencia, mostrando como una clase puede derivar de otra.

class ElectricCar: Car {
    var batteryLevel: Int
    
    init(model: String, numberOfSeats: Int, currentGear: Int, batteryLevel: Int) {
        self.batteryLevel = batteryLevel
        super.init(model: model, numberOfSeats: numberOfSeats, currentGear: currentGear)
    }
    
    override func changeGear(up: Bool) {
        super.changeGear(up: up)
        print("Battery level is \(batteryLevel)%")
    }
}

// la clase 'ElectrCar' hereda de 'Car' y añade una propiedad 'batteryLevel' y anula el metodo 'chargeGear'

/// **METODOS Y PROPIEDADES**

// - Explicacion de como los metodos permiten que una clase realice acciones.
// - las propiedades almacenan datos y pueden tener observadores para reaccionar a cambios en los valores.

/// **CONTROL DE ACCESO**

// - Introduccion al control de acceso, que protege de tu codigo para que no se puedan usar  fuera de su contexto.
// - Ejemplo de niveles de acceso: public, internal, private y fileprivate

//MARK: - Pagina 2

/// **INTROCUCCION A HERENCIAS**

/// *Concepto: La herencia permite que una clase (subclase) herede propiedades y metodos de otra clase (superclase).Esto facilita la reutilizacion del codigo y la creacion de nuevas funcionalidades basadas en clses existentes.

class Employee {
    let hours: Int
    
    init(hours: Int) {
        self.hours = hours
    }
    
    func printSummary() {
            print("I work \(hours) hours a day.")
        }
    }

    let novall = Developer(hours: 8)
    novall.printSummary()



/// **CFREACION DE SUBCLASES**

/// *Subclase:Dos subclase que heredan de 'Employee' y personalizan el metodo 'work()'

class Developer: Employee {
    func work() {
        print("I'm writing code for \(hours) hours.")
    }
}

class Manager: Employee {
    func work() {
        print("I'm Going to meeting for \(hours) hours.")
    }
    
}

/// **USO DE SUBCLASES**
 
/// *Instancias de clases*
let robert = Developer(hours: 8)
let joseph = Manager(hours: 10)

robert.work()
joseph.work()


/// **METODOS Y PROPIEDADES COMPARTIDAS**

/// *Metodos en la Superclase: La subclase pueden usar metodos de la superclase*

/*func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

let novall = Developer(hours: 8)
novall.printSummary()*/


/// *Notas Adicionales
// - Política de Reutilización de Código: Usar la herencia ayuda a evitar la duplicación de código, permitiendo que las subclases compartan y extiendan la funcionalidad de la superclase.
// - Métodos Especializados: Las subclases pueden tener métodos especializados que no están presentes en la superclase, proporcionando comportamiento específico mientras aprovechan la funcionalidad compartida.

//MARK: - Pagina 3

/// **COMO AÑADIR INICIALIZADORES PARA LAS CLASES**

/// *Introducción a los Inicializadores de Clases

// - Concepto: Los inicializadores en clases son más complicados que en estructuras. Es crucial que las subclases llamen al inicializador de su superclase después de configurar sus propias propiedades.


/// *Inicializadores de Clases

// - Diferencia con Estructuras: Swift no genera automáticamente un inicializador por miembros para las clases, a diferencia de las estructuras. Por lo tanto, es necesario escribir su propio inicializador o proporcionar valores predeterminados para todas las propiedades de la clase.

// Definición de la clase base Vehicle
class Vehicle {
    let isElectric: Bool
    
    // Inicializador de Vehicle
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// Definición de la clase Car que hereda de Vehicle
class Car2: Vehicle {
    let isConvertible: Bool
    
    // Inicializador de Car que llama al inicializador de la superclase Vehicle
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// Creación de una instancia de Car
let teslaX = Car2(isElectric: true, isConvertible: false)


/// **Explicación del Código
/// *Clase Vehicle:

// - Define una propiedad isElectric de tipo Bool.
// - Tiene un inicializador que establece el valor de isElectric.

/// *Clase Car:

// - Hereda de Vehicle.
// - Añade una nueva propiedad isConvertible de tipo Bool.
// - Su inicializador recibe dos parámetros (isElectric y isConvertible) y llama al inicializador de la superclase Vehicle usando super.init.

/// *Instancia teslaX:

// - Crea un objeto de tipo Car con isElectric establecido en true e isConvertible en false.


//Esta clase tiene una propiedad booleana 'isElectric' y un inicializador para establecer su valor.


/// **CREACION DE UNA SUBCLASE**

/*class Car: Vehicle {
    let isConvertible: Bool
    
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}*/

//Aquí, Car hereda de Vehicle y agrega una nueva propiedad isConvertible.
//El inicializador de Car recibe tanto isElectric como isConvertible, y llama al inicializador de la superclase usando super.init.

//MARK: -Pagina 4

/// **COMO COPIAR CLASES

// Definición de la clase base Vehicle
class Vehicle2 {
    let isElectric: Bool
    
    // Inicializador de Vehicle
    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// Definición de la clase Car que hereda de Vehicle
class Car3: Vehicle2 {
    let isConvertible: Bool
    
    // Inicializador de Car que llama al inicializador de la superclase Vehicle
    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

// Creación de una instancia de Car
let teslaX2 = Car3(isElectric: true, isConvertible: false)

// Definición de la clase User con copia profunda
class User {
    var username = "Anonymous"
    
    // Método de copia profunda
    func copy() -> User {
        let user = User()
        user.username = self.username
        return user
    }
}

// Ejemplo de uso de la clase User y copia profunda
var user1 = User()
var user2 = user1.copy()
user2.username = "Taylor"

print(user1.username)  // Imprime "Anonymous"
print(user2.username)  // Imprime "Taylor"


/// **xplicación del Código

            /// *Clase Vehicle:

// - Clase base con una propiedad isElectric y un inicializador para configurarla.

            /// *Clase Car:

// - Subclase de Vehicle que agrega una propiedad isConvertible y un inicializador que también llama al inicializador de la superclase.

            /// *Clase User:

// - Clase con una propiedad username y un método copy() para realizar una copia profunda de la instancia.


           /// *Uso de las Clases:

// - Creación de una instancia de Car llamada teslaX.
// - Creación de instancias de User (user1 y user2), donde user2 es una copia profunda de user1.
// - Este código demuestra la inicialización de propiedades en clases, la herencia entre clases, y cómo realizar copias profundas para evitar la compartición de datos entre instancias en Swift.


//MARK: - Pagina 5

/// **COMO CREAR UN DESINICIALIZADOR PARA UNA CLASE**

/// **Puntos clave:

// - Sintaxis de desinicializadores: No se usa func y no toman parámetros ni devuelven valores.
// - Llamada automática: El desinicializador se invoca automáticamente cuando se destruye la última referencia a una instancia de clase.
// - Ámbito (Scope): Cuando una variable o constante sale del ámbito, su memoria es liberada y, si es la última referencia a un objeto de clase, se llama al desinicializador.

class User2 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
}

for i in 1...3 {
    let user2 = User2(id: i)
    print("User \(user2.id): I'm in control!")
}

var users = [User]()

for i in 1...3 {
    let user2 = User2(id: i)
    print("User \(user2.id): I'm in control!")
    users.append(user1)
}

print("Loop is finished!")
users.removeAll()
print("Array is clear!")

/// **Explicación del código:

// - Clase User: Tiene un identificador y mensajes de impresión en su inicializador y desinicializador.
// - Creación y destrucción en bucle: En el primer bucle, los objetos User son creados y destruidos en cada iteración.
// - Uso de un array: En el segundo ejemplo, los objetos User se almacenan en un array y solo se destruyen cuando el array se vacía.

//MARK: Pagina 5

/// **COMO TRABAJAR CON VARIABLES DENTRO DE LAS CLASES**

class User10 {
    var name = "Paul"
}

let user = User10()
user.name = "Taylor"
print(user.name)  // Imprime "Taylor"

var user8 = User10()
user8.name = "Taylor"
user8 = User10()
print(user8.name)  // Imprime "Paul"

/// *Explicación del código:

// - Clase User: Define una clase con una propiedad variable name inicializada con "Paul".
// - Instancia constante user: Se crea una instancia constante de User, se cambia su propiedad name a "Taylor" y se imprime.
// - Instancia variable user2: Se crea una instancia variable de User, se cambia su propiedad name a "Taylor", luego se reasigna a una nueva instancia de User, y se imprime la propiedad name de la nueva instancia, que vuelve a ser "Paul".

//MAK: - CheckPoint 7

/*Tu desafío es el siguiente: hacer una jerarquía de clases para los animales, comenzando con Animal en la parte superior, luego Perro y Gato como subclases, luego Corgi y Caniche como subclases de Perro, y Persa y León como subclases de Gato.

 Pero hay más:

 The Animal class should have a legs integer property that tracks how many legs the animal has.
 The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 The Cat class should have a matching speak() method, again with each subclass printing something different.
 The Cat class should have an isTame Boolean property, provided using an initializer.
 Te daré algunos consejos en un momento, pero primero te recomiendo que lo pruebes tú mismo.*/

// Clase base Animal
class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

// Subclase Dog de Animal
class Dog: Animal {
    func speak() {
        print("Woof! Woof!")
    }
}

// Subclases de Dog
class Corgi: Dog {
    override func speak() {
        print("Yip! Yip!")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Bark! Bark!")
    }
}

// Subclase Cat de Animal
class Cat: Animal {
    var isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("Meow! Meow!")
    }
}

// Subclases de Cat
class Persian: Cat {
    override func speak() {
        print("Purr! Purr!")
    }
}

class Lion: Cat {
    override func speak() {
        print("Roar! Roar!")
    }
}

// Pruebas
let myCorgi = Corgi(legs: 4)
let myPoodle = Poodle(legs: 4)
let myPersian = Persian(legs: 4, isTame: true)
let myLion = Lion(legs: 4, isTame: false)

myCorgi.speak()     // Imprime "Yip! Yip!"
myPoodle.speak()    // Imprime "Bark! Bark!"
myPersian.speak()   // Imprime "Purr! Purr!"
myLion.speak()      // Imprime "Roar! Roar!"

