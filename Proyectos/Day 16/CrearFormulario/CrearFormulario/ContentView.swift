//
//  ContentView.swift
//  CrearFormulario
//
//  Created by Raúl Gallego Alonso on 25/6/24.
//

import SwiftUI

struct ContentView: View { //  Define una nueva vista llamada ContentView.
    var body: some View { // Declara la propiedad 'body' que describe el contenido de la vista.
        Form {  // crea un formulario
            Section {
                Text("Hello, World!")
            }
            Section {  // crea una seccion del formulario
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
            Section {
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    ContentView()
}
