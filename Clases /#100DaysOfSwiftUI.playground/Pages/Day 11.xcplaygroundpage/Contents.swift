import Foundation

/// **CONTROL DE ACCESO - STRUCTURAS segunda parte`


struct BankAccount {
   private(set) var funds = 0
    
    mutating func deposit(amount: Int) {
        funds += amount
    }
    
    mutating func withdraw(amount: Int) -> Bool {
        if funds >= amount {
            funds -= amount
            return true
        } else {
            return false
        }
    }
}

//Eso tiene métodos para depositar y retirar dinero de una cuenta bancaria, y debe usarse de la siguiente manera:
var account = BankAccount()
account.deposit(amount: 100)

let succes = account.withdraw(amount: 200)

if succes {
    print("Withdrew money successsfully")
} else {
    print("Failed to get the money")
}

/*Swift nos ofrece varias opciones:
 
 Usa private para "no dejar que nada fuera de la estructura use eso".

 Usa 'fileprivate' para "no dejes que nada fuera del archivo actual use eso".

 Usa el 'public' para "dejar que cualquiera, en cualquier lugar, use eso".*/

 
//MARK: - Pagina 2
/// **PROPIEDADES Y METODOS ESTATICOS**

/*Conceptos Clave
 
 - Definición: Las propiedades y métodos estáticos se adjuntan a la estructura (o clase) en sí misma, no a instancias particulares de la estructura.
 - Uso: Se usan directamente en la estructura, sin necesidad de crear una instancia.*/

//En primer lugar, echemos un vistazo a un ejemplo simplificado de cómo crear y usar propiedades y métodos estáticos:
struct School {
    static var studentCount = 0
    
    
    //Definición de un Método Estático: add(student:) es un método estático. Puede ser llamado directamente en School sin necesidad de una instancia de School.
    static func add(student: String) {
        print("\(student) joined the school")
        studentCount += 1
    }
}
//Aquí, studentCount y add(student:) son estáticos y se usan directamente en School



/// **⚠️ Diferencias entre self y Self:
 
 //self: Se refiere al 'valor' actual de la estructura.
 //Self: Se refiere al 'tipo' actual de la estructura.


/// **Uso de Propiedades y Métodos Estáticos:**

School.add(student: "Taylor Swift") //Aquí, estamos llamando al método estátic '.add(student:)' y accediendo a la propiedad estátic 'studentCount' directamente a través del tipo School.

print(School.studentCount)

/// **Propiedades y Métodos Estáticos
/// *Propiedades Estáticas: Son variables o constantes que están asociadas con el tipo (como una clase, estructura o enumeración), no con una instancia específica de ese tipo.

/// *Métodos Estáticos: Son funciones que pertenecen al tipo y no a una instancia específica.



/// *Organización de Datos Comunes:
//Las propiedades estáticas pueden almacenar valores compartidos en varias partes de una aplicación.*/

struct appData {
    static let version = "1.3 beta 2"
    static let saveFilename = "settings.json"
    static let homeURL = "https://www.hackingwithswift.com"
}
//Apuntes: se usan para datos de una instancia en una estructura.


/// *Creación de Datos de Ejemplo:
//SwiftUI se beneficia de ejemplos de datos para mostrar vistas previas de la aplicación durante el desarrollo.

struct Employee {
    let username: String
    let password: String
    
    static let example = Employee(username: "cfederighi", password: "hairforceone")
}

/// **Beneficios de Usar Propiedades y Métodos Estáticos
/*
 - Datos Compartidos: Permite definir datos que son compartidos entre todas las instancias de un tipo.
 - Organización: Facilita la organización de datos y funciones que no dependen de una instancia específica.
 - Acceso Sencillo: Permite acceder a propiedades y métodos sin crear instancias, lo que puede ser útil para utilidades, constantes globales, o datos de configuración.*/
 
 /// **Restricciones
/*
 -No Pueden Acceder a Propiedades o Métodos de Instancia: Las propiedades y métodos estáticos no pueden acceder a propiedades o métodos de instancia directamente, ya que no tienen una instancia específica a la cual referirse.
 -Inmutabilidad: Si una estructura o clase es declarada como constante, sus propiedades de instancia no pueden ser modificadas, pero las propiedades estáticas pueden serlo si no están marcadas como constantes (let).*/

/// *Conclusión
/*Las propiedades y métodos estáticos, son herramientas para manejar datos compartidos y crear ejemplos de datos, especialmente útiles en el desarrollo con SwiftUI. Aunque no siempre son necesarios, pueden simplificar el manejo de datos comunes y facilitar el desarrollo de interfaces de usuario mediante datos de ejemplo.
 
 La propiedad static, define elementos que pertenecen al tipo en sí mismo en lugar de a sus instancias. Esto es útil para datos y funciones que deben ser accesibles globalmente dentro del contexto del tipo.
 */


//MARK: - Pagina 3
/// **Sumario de struct**

/// **CONCEPTOS CLAVES DE LAS ESTRUCTURAS

/// *Definición de Estructuras: Se crean utilizando la palabra clave struct.

struct Persona {
    var nombre: String
    var edad:  Int
}

/// **PROPIEDADES Y METODOS

// -Las estructuras pueden contener variables (var) y constantes (let), conocidas como propiedades, y funciones, conocidas como métodos.

// -Si un método modifica las propiedades de su estructura, debe ser marcado como mutating.


/// **Propiedades Computadas:

// -Las propiedades pueden almacenar valores en memoria o ser calculadas cada vez que se acceden.

struct Rectangulo {
    var ancho: Double
    var alto: Double
    var area: Double {
        return ancho * alto
    }
}

/// **OBSERVADORES DE PROPIEDADES

// -'didSet' y 'willSet' permiten ejecutar código cuando una propiedad cambia.

struct Cuenta {
    var saldo: Double {
        willSet {
            print("El saldo cambiará a \(newValue)")
        }
        didSet {
            print("El saldo cambió de \(oldValue) a \(saldo)")
        }
    }
}

/// **INICIALIZADORES**

// -Swift genera un inicializador para todas las estructuras utilizando los nombres de las propiedades.

// -Puedes crear inicializadores personalizados, pero todas las propiedades deben tener un valor antes de que el inicializador termine.
struct Persona2 {
    var nombre: String
    var edad: Int
    
    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }
}

/// **Acceso a Propiedades y Métodos:**

// -Puedes marcar propiedades y métodos como disponibles o no disponibles externamente según se necesite.


/// **PROPIEDADES Y METODOS ESTATICOS**

// -Se pueden adjuntar propiedades o métodos directamente a una estructura para usarlos sin crear una instancia.

struct Contador {
    static var cuenta = 0
    
    static func incrementar() {
        cuenta += 1
    }
}

Contador.incrementar()
print(Contador.cuenta)

//MARK: -CheckPoint 6

/*Creas una estructura para almacenar información sobre un coche, incluido su modelo, el número de asientos y el equipo actual, y luego agregue un método para cambiar los engranajes hacia arriba o hacia abajo. Piensa en las variables y el control de acceso: ¿qué datos deben ser una variable en lugar de una constante, y qué datos deben exponerse públicamente? ¿Debería el método de cambio de marchas validar su entrada de alguna manera?*/

struct Coche {
    let modelo: String
    let numeroDeAsientos: Int
    private(set) var engranajeActual: Int
    
    //Inicializador personalizado para establecer propiedades
    init(modelo: String, numeroDeAsientos: Int, engranajeActual: Int) {
        self.modelo = modelo
        self.numeroDeAsientos = numeroDeAsientos
        self.engranajeActual = engranajeActual
    }
    
    //Metodo para cambiar las marchas hacia arriba
    mutating func subirMarcha() {
        if engranajeActual < 10 {
            engranajeActual += 1
        } else {
            print("No se puede subir mas de marcha 10")
        }
    }
    //Metodo para cambiar la marcha hacia abajo
    mutating func bajarMarcha() {
        if engranajeActual > 1 {
            engranajeActual -= 1
        } else {
            print("No se puede bajar por debajo de la marcha 1")
        }
    }
}

/// **Ejemplo de Uso

//Ahora, veamos cómo usar esta estructura: 👇
var miCoche = Coche(modelo: "Audi Q5", numeroDeAsientos: 5, engranajeActual: 1)

// Cambiando de marcha
miCoche.subirMarcha()
print(miCoche.engranajeActual)

miCoche.bajarMarcha()
print(miCoche.engranajeActual)

// Intentar bajar de marcha mas alla del limite
miCoche.bajarMarcha()
