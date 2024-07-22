//
//  ContentView.swift
//  ModificadoresEntorno
//
//  Created by Raúl Gallego Alonso on 22/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                //.font(.largeTitle)
            // .font() se utiliza para establecer el estilo de fuente de una vista de texto.
            // .largeTitle es uno de los estilos de fuente predefinidos en SwiftUI, que representa un tamaño de fuente grande.
            
                .blur(radius: 0) // es un modificador de desenfoque
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5)
    }
}

#Preview {
    ContentView()
}
