//
//  ContentView.swift
//  UsoStack
//
//  Created by Raúl Gallego Alonso on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //VStack(alignment: .leading) { // esta vista me la alinea a la izquierda
       /* HStack(spacing: 20) {  // vista en vertical con un espacio de 20 entre los textos
       
            Text("Hello, world!")
            Text("This is another text view")*/
        
     /*   VStack {
            Spacer() // Este comando crea un espacio desde arriba hacia abajo. (2)
            
            Text("First")
            Text("Second")
            Text("Third")
            
            Spacer()
            Spacer() // este comando crea un espacio que lleva la vista hacia arriba.(1) */
        
        
        ZStack(alignment: .top) {
            Text("Hello, world!")
            Text("This is another text view")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


/// **NOTAS DE LAS VISTAS**

/*HStack - Vista en horizontal
 VStack - Vista en vertical
 ZStack - Vista en profundidad*/
