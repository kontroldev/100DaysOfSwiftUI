//
//  ContentView.swift
//  ViewCoposition
//
//  Created by Raúl Gallego Alonso on 23/7/24.
//

import SwiftUI

struct Capsuletext: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
        //.largeTitle es un estilo de fuente predefinido en SwiftUI que hace que el texto sea grande, ideal para títulos principales.
        
            .padding()
        // Agrega espacio adicional alrededor de la vista.
        
            .foregroundStyle(.white)
        // Establece el estilo del primer plano de la vista. Para las vistas de texto, esto suele significar el color del texto.
        
            .background(.blue)
        // Establece el color de fondo de la vista.
        
            .clipShape(.capsule)
        // Recorta la vista a la forma especificada.
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Capsuletext(text: "First")
            Capsuletext(text: "Second")
                
        }
    }
}

#Preview {
    ContentView()
}




