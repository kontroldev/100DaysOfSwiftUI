//
//  ContentView.swift
//  EstadoEnlaces
//
//  Created by Raúl Gallego Alonso on 26/6/24.
//

import SwiftUI

struct ContentView: View {
    //@State se utiliza para declarar propiedades dentro de una vista que pueden cambiar con el tiempo y necesitan reflejarse en la interfaz.
    @State private var name = ""

    var body: some View {
        Form {
            // apartado para introducir datos
            TextField("Enter your name", text: $name) // $ 👇
            // apartado para enseñar datos
            Text("Your name is \(name)")
        }
    }
}
/* que es $: es un binding, es una conexión bidireccional entre una propiedad que almacena datos y una propiedad que lee y escribe esos datos. En otras palabras, permite que una vista lea y modifique una propiedad de estado ubicada en otra parte de la vista o en un modelo de datos.*/


#Preview {
    ContentView()
}
