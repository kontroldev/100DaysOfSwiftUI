//
//  ContentView.swift
//  ColorFrames
//
//  Created by Raúl Gallego Alonso on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       /* VStack {
            Text("Hello, world!")
        }
        .background(.red)
       // .padding() // agregar espacio adicional alrededor de una vista. */
        
        ZStack {
            Color.red  // esto rellena toda la pantalla del color selecionado.
            Text("You content")
        }
    }
}

#Preview {
    ContentView()
}
