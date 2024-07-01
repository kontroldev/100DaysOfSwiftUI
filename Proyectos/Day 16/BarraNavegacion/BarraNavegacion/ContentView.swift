//
//  ContentView.swift
//  BarraNavegacion
//
//  Created by Raúl Gallego Alonso on 26/6/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack { // esto hace que NO llegue la lista del formulario a solapar con el reloj.
            Form {  // esto crea un formulario
                Section {
                    Text("Hello, World!")
                }
                Section {  // esto crea una seccion del formulario
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
            .navigationTitle("SwiftUI") // '.navigationTitle' lo ponemos cuando cerramos las 'section' y hace poner un titulo al 'NavigationStack'.
            .navigationBarTitleDisplayMode(.inline) // esto hace poner el titulo mas pequeño y en medio.
        }
    }
}
#Preview {
    ContentView()
}
