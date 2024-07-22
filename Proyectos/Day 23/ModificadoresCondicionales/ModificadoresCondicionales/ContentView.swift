//
//  ContentView.swift
//  ModificadoresCondicionales
//
//  Created by Raúl Gallego Alonso on 22/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedtext = false
    
    var body: some View {
        if useRedtext {
            Button("Hello, world!") {
                useRedtext.toggle() // Control de interfaz de usuario que permite alternar entre dos estados, como "encendido" y "apagado".
            }
            // .foregroundStyle(useRedtext ? .red : .blue) // esto darle al "boton2 de Hello world cambia de color.
            .foregroundStyle(.red)
        } else {
            Button("Hello, world!") {
                useRedtext.toggle()
            }
            .foregroundStyle(.blue)
        }
    }
}

#Preview {
    ContentView()
}
