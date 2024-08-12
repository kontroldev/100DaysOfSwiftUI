//
//  ContentView.swift
//  WordScramble
//
//  Created by Raúl Gallego Alonso on 12/8/24.
//

import SwiftUI

struct ContentView: View {
    // Una lista de nombres para mostrar en la lista
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        //        List {
        //            Section("Section 1") {
        //                Text("Static row 1")
        //                Text("Static row 2")
        //            }
        //
        //            Section("Section 2") {
        //                ForEach(0..<5) {
        //                    Text("Dynamic Row \($0)")
        //                }
        //            }
        //
        //            Section("Section 3") {
        //                Text("section Row ")
        //                Text("Static Row 4")
        //            }
        //        }
        //        .listStyle(.grouped)
        //        //estás eligiendo un estilo de lista que agrupa los elementos de la lista en secciones con encabezados y bordes alrededor de cada sección.
        //
        List {
            // Fila estática en la parte superior de la lista
            Text("Static Row")
            // Fila dinámica generada a partir de la lista de personas
            ForEach(people, id: \.self) { // Muestra el nombre de cada persona en una fila de la lista
                Text($0)
            }
            Text("Static Row")
        }
    }
}

#Preview {
    ContentView()
}
