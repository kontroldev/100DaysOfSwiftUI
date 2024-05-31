//
//  ContentView.swift
//  WeSplit
//
//  Created by Raúl Gallego Alonso on 30/5/24.
//

import SwiftUI

// esto viene del protocolo View
struct ContentView: View {
    // define una propiedad 'some View' y devolvera algo que se ajuste al protocolo View.
    var body: some View {
        VStack {
            Image(systemName: "globe") //'globe' es una imagen que esta por defecto en swift entre otros.
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding() // escala la imagen estilo de primer plano y relleno
    }
}

#Preview {    // esto genera la vista de aqui 👉
    ContentView()
}
// Si ponemos al muadilla y p sale predictivo.
// y si queremos tener otra vista aqui ponemos #preview y el nombre de la otra vista que queremos ver aqui.
