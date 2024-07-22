//
//  ContentView.swift
//  ViewProperties
//
//  Created by Raúl Gallego Alonso on 22/7/24.
//

import SwiftUI

struct ContentView: View {
    var motto1: some View {
        Text("Dracco dormiens")  // *1
    }
    
    let motto2 = Text("nunquam titilandus")
    
    @ViewBuilder var spells: some View {
        Text("Lumos")
        Text("Obliviate")
    }
    var body: some View {
        VStack {
            motto1
                .foregroundStyle(.red)
            motto2
                .foregroundStyle(.blue)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


// *1 Swift no nos permite crear una propiedad almacenada que se refiera a otras propiedades almacenadas, porque causaría problemas cuando se crea el objeto. Esto significa que intentar crear un campo de texto vinculado a una propiedad local causará problemas.
