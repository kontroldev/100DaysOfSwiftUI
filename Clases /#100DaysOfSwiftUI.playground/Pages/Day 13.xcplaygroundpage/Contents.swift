import Foundation

/// **COMO CREAR U USAR PROTOCOLOS**

/// *1.Definición de Protocolos: Los protocolos permiten definir una serie de propiedades y métodos sin proporcionar implementaciones. Esto asegura que los tipos que conformen el protocolo cumplirán con ciertas expectativas.


/// *2.Implementación de Protocolos:

// - Se crea un protocolo usando la palabra clave protocol seguida del nombre del protocolo.
// - Dentro del protocolo, se listan los métodos y propiedades que se deben implementar.
// - Un tipo de datos (struct, class, enum) puede adoptar un protocolo implementando los métodos y propiedades especificados.


/// *3.Ejemplo de Uso:

// - Se define un protocolo Vehicle con métodos estimateTime(for:) y travel(distance:).
// - Una estructura Car que conforme al protocolo Vehicle debe implementar estos métodos.
// - Se muestra cómo utilizar un protocolo para permitir que una función acepte cualquier tipo que conforme al protocolo, en lugar de tipos específicos como Car o Bicycle.


/// *4.Propiedades en Protocolos:

// - Los protocolos pueden requerir propiedades legibles y/o escribibles.
// - Los tipos que conformen el protocolo deben implementar estas propiedades.


// 5.Ventajas de los Protocolos:

// -Permiten escribir funciones y métodos más flexibles.
// -Facilitan el uso de múltiples tipos de datos que compartan cierta funcionalidad, sin necesidad de conocer los detalles específicos de cada tipo.

// Definición del protocolo Vehicle
protocol Vehicle {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

// Estructura Car que conforma al protocolo Vehicle
struct Car: Vehicle {
    let name = "Car"
    var currentPassengers = 1

    func estimateTime(for distance: Int) -> Int {
        return distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }

    func openSunroof() {
        print("It's a nice day!")
    }
}

// Estructura Bicycle que conforma al protocolo Vehicle
struct Bicycle: Vehicle {
    let name = "Bicycle"
    var currentPassengers = 1

    func estimateTime(for distance: Int) -> Int {
        return distance / 10
    }

    func travel(distance: Int) {
        print("I'm cycling \(distance)km.")
    }
}

// Función commute que usa el protocolo Vehicle
func commute(distance: Int, using vehicle: Vehicle) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("That's too slow! I'll try a different vehicle.")
    } else {
        vehicle.travel(distance: distance)
    }
}

// Uso de las estructuras Car y Bicycle con la función commute
let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)

// Función getTravelEstimates que acepta un array de tipos que conformen al protocolo Vehicle
func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
    for vehicle in vehicles {
        let estimate = vehicle.estimateTime(for: distance)
        print("\(vehicle.name): \(estimate) hours to travel \(distance)km")
    }
}

// Llamada a getTravelEstimates con un array de Car y Bicycle
let vehicles: [Vehicle] = [car, bike]
getTravelEstimates(using: vehicles, distance: 150)


/// **Explicación del Código
    /// *1.Definición del Protocolo:

// -Vehicle es un protocolo que requiere dos propiedades (name y currentPassengers) y dos métodos (estimateTime(for:) y travel(distance:)).


     /// *2.Conformidad con el Protocolo:

// -Car y Bicycle son estructuras que conforman al protocolo Vehicle, proporcionando implementaciones específicas para los métodos y propiedades requeridas.


     /// *3.Funciones que Utilizan Protocolos:

// -commute(distance:using:) es una función que acepta cualquier tipo que conforme al protocolo Vehicle, permitiendo flexibilidad en los tipos de vehículos que se pueden usar.
// -getTravelEstimates(using:distance:) acepta un array de tipos que conformen al protocolo Vehicle, demostrando cómo se puede trabajar con múltiples tipos que comparten la misma funcionalidad.
// -El uso de protocolos en Swift permite crear código más flexible y modular, facilitando la interoperabilidad entre diferentes tipos que comparten comportamientos comunes.

//MARK: -Pagina 2

/// **TIPOS DE LA DEVOLUCION**

/// *Los tipos de devolución opacos en Swift, es una característica avanzada que permite simplificar el código y hacerlo más flexible. A pesar de su complejidad, son esenciales, especialmente en SwiftUI, donde se usan ampliamente.

/// **Puntos clave:

       /// *1.*Definición y uso:

// - Los tipos de devolución opacos permiten devolver un tipo concreto sin especificarlo explícitamente.
// - Se usa la palabra clave some antes del tipo de retorno.


      /// *2.Ejemplo básico:

// - Se presentan dos funciones: getRandomNumber y getRandomBool, que devuelven un entero aleatorio y un booleano aleatorio, respectivamente.
// - Ambas funciones se modifican para usar some Equatable como tipo de retorno, permitiendo comparar los resultados a pesar de no conocer el tipo específico devuelto.


      /// *3.Ventajas:

// - Ocultación de información: Permiten ocultar detalles del tipo específico mientras mantienen la funcionalidad.
// - Flexibilidad: El código se puede cambiar internamente sin afectar las partes que usan estos tipos de devolución.
// - Uso en SwiftUI: Esencial para definir vistas de manera compacta y flexible, sin necesidad de especificar todos los detalles del tipo de vista.


     /// *4.Aplicación en SwiftUI:

// - Se utiliza some View para describir vistas, permitiendo que SwiftUI gestione los detalles exactos del tipo de vista.


    /// *5.Comparación con otros enfoques:

// - A diferencia de devolver un protocolo, que puede esconder demasiada información, los tipos de devolución opacos permiten a Swift conocer el tipo exacto mientras lo ocultan del desarrollador.

func getRandomNumber() -> some Equatable {
    Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
    Bool.random()
}

/// **Explicación del código

    /// *Funciones con tipos opacos:

// - getRandomNumber: Devuelve un número entero aleatorio entre 1 y 6.
// - getRandomBool: Devuelve un valor booleano aleatorio (true o false).


   /// *Uso de some Equatable:

// - some Equatable indica que la función devolverá un tipo que conforma el protocolo Equatable, pero sin especificar cuál.


   /// *Comparación de resultados:

// - A pesar de que getRandomNumber y getRandomBool devuelven tipos diferentes (Int y Bool), ambos pueden ser tratados como Equatable, permitiendo comparaciones y otras operaciones comunes a este protocolo.

//MARK: - Pagina 3

      /// *1.Introducción a las Extensiones:

// - Las extensiones permiten añadir métodos, propiedades y otros elementos a tipos existentes sin necesidad de modificar su código fuente original.
// - Un ejemplo práctico se da con el método trimmingCharacters(in:) que recorta espacios en blanco y nuevas líneas de una cadena.

      /// *2.Añadir Métodos a una Extensión:

// - Se muestra cómo simplificar el uso del método trimmingCharacters(in:) mediante la creación de una extensión:



// -También se explica cómo las extensiones hacen que la funcionalidad adicional sea fácil de encontrar y utilizar.


     /// *3.Modificar Valores en su Lugar:

// -Se ilustra cómo las extensiones pueden modificar valores directamente:


/// *4.Añadir Propiedades Computadas:

// - Las extensiones pueden agregar propiedades computadas a tipos existentes. Un ejemplo es añadir una propiedad lines a String que divide la cadena en un array de líneas:



/// *5.Iniciadores en Extensiones:

// - Se muestra cómo mantener el inicializador automático por miembros de Swift mientras se añade un inicializador personalizado a través de una extensión:


// Extensión para recortar espacios en blanco y nuevas líneas
extension String {
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    mutating func trim() {
        self = self.trimmed()
    }
    
    var lines: [String] {
        self.components(separatedBy: .newlines)
    }
}

// Estructura Book con extensión para un inicializador personalizado
struct Book {
    let title: String
    let pageCount: Int
    let readingHours: Int
}

extension Book {
    init(title: String, pageCount: Int) {
        self.title = title
        self.pageCount = pageCount
        self.readingHours = pageCount / 50
    }
}

/// **Explicación

       /// *1.Extensión de String:

// - Método trimmed(): Este método extiende la funcionalidad de String para devolver una nueva cadena sin espacios en blanco ni nuevas líneas al principio y al final.
// - Método trim(): Un método mutante que modifica la cadena original eliminando los espacios en blanco y las nuevas líneas directamente.
// - Propiedad lines: Una propiedad computada que divide la cadena en un array de líneas utilizando el separador de nuevas líneas.


      /// *2.*Estructura Book y su Extensión:

// - Estructura Book: Define un libro con propiedades para el título, el número de páginas y las horas de lectura estimadas.
// - Inicializador en la Extensión: Proporciona un inicializador personalizado que calcula las horas de lectura basadas en el número de páginas, manteniendo el inicializador automático por miembros disponible.


//MARK: - Pagina 4

/// **Cómo crear y usar extensiones de protocolo**

// Extensio para Array para comprabar si no esta vacio.

extension Array {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

//Extension para 'Collection' para comprobar si no esta vacio.
extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

// Uso de isNotEmpty de diferentes colecciones
let arrayGuests: [String] = ["Mario", "Luigi", "Peach"]
let setGuests: Set<String> = ["Mario", "Luigi", "Peach"]
let diccionaryGuests: [String: String] = ["A": "Mario", "B": "Luigi", "C": "Peach"]

if arrayGuests.isNotEmpty {
    print("Array guest count: \(arrayGuests.count)")
}

if setGuests.isNotEmpty {
    print("Set guest count: \(setGuests.count)")
}

if diccionaryGuests.isNotEmpty {
    print("Diccionary guest count: \(diccionaryGuests.count)")
}

//Protocolos con la implementacion predeterminada en una extension.
protocol Person {
    var name: String { get }
    func sayHello()
}

extension Person {
    func sayHello() {
        print("Hi, I'm \(name)")
    }
}

struct Employee: Person {
    let name: String
}

let  taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


/// **Resumen de la Lección
/// *La lección se centra en cómo utilizar extensiones de protocolo en Swift para mejorar y extender la funcionalidad de diferentes tipos de datos.

            /// *1.Extensiones de Array:

// - Se muestra cómo añadir una propiedad calculada isNotEmpty a arrays para comprobar si no están vacíos. Esto mejora la legibilidad del código.


             /// *2.Extensiones de Collection:

// - En lugar de añadir isNotEmpty solo a arrays, se extiende el protocolo Collection para que esta propiedad esté disponible en todos los tipos que conforman Collection (arrays, sets, diccionarios). Esto permite una mayor reutilización del código.

            /// *3.Uso de isNotEmpty en Diferentes Colecciones:

// -Se demuestra cómo isNotEmpty puede ser utilizado en diferentes colecciones como arrays, sets y diccionarios, mejorando la flexibilidad y consistencia del código.


              /// *4.Protocolos con Implementaciones Predeterminadas:

// -Se introduce cómo se puede definir un protocolo con métodos requeridos y luego proporcionar implementaciones predeterminadas de esos métodos en una extensión del protocolo.
// -Se da el ejemplo del protocolo Person con un método sayHello(), y se muestra cómo un tipo conforme (Employee) puede usar la implementación predeterminada o proporcionar la suya propia.

              /// *5.*Beneficios Clave
// -Reutilización del Código: Al extender protocolos en lugar de tipos específicos, se puede aplicar la misma funcionalidad a múltiples tipos de datos.
// - Legibilidad del Código: Propiedades como isNotEmpty hacen que el código sea más intuitivo y fácil de leer.
// - Modularidad y Flexibilidad: Proveer implementaciones predeterminadas en protocolos permite que los tipos conformes utilicen estas implementaciones sin necesidad de duplicar código.**ç


//MARK: - CheckPoint 8

/*Su desafío es el siguiente: hacer un protocolo que describa un edificio, agregar varias propiedades y métodos, luego crear dos estructuras, House y Office, que se ajusten a él. Su protocolo debe requerir lo siguiente:*/

/* 1.Una propiedad que almacena cuántas habitaciones tiene.
   2.Una propiedad que almacena el costo como un número entero (por ejemplo, 500.000 para un edificio que cuesta 500.000 dólares).
   3.Una propiedad que almacena el nombre del agente inmobiliario responsable de la venta del edificio.
   4.Un método para imprimir el resumen de ventas del edificio, describiendo lo que es junto con sus otras propiedades.*/

// Definición del protocolo Building
protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get }
    var realEstateAgent: String { get }
    
    func printSalesSummary()
}

// Estructura House que se ajusta al protocolo Building
struct House: Building {
    var numberOfRooms: Int
    var cost: Int
    var realEstateAgent: String
    
    func printSalesSummary() {
        print("House for sale:")
        print("Number of rooms: \(numberOfRooms)")
        print("Cost: $\(cost)")
        print("Real Estate Agent: \(realEstateAgent)")
    }
}

// Estructura Office que se ajusta al protocolo Building
struct Office: Building {
    var numberOfRooms: Int
    var cost: Int
    var realEstateAgent: String
    
    func printSalesSummary() {
        print("Office for sale:")
        print("Number of rooms: \(numberOfRooms)")
        print("Cost: $\(cost)")
        print("Real Estate Agent: \(realEstateAgent)")
    }
}

// Creación de instancias de House y Office
let myHouse = House(numberOfRooms: 4, cost: 500000, realEstateAgent: "Alice Johnson")
let myOffice = Office(numberOfRooms: 10, cost: 1200000, realEstateAgent: "Bob Smith")

// Impresión de resúmenes de ventas
myHouse.printSalesSummary()
myOffice.printSalesSummary()
