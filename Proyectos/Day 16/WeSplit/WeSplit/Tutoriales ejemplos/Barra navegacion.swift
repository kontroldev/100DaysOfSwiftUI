//
//  SwiftUIView.swift
//  WeSplit
//
//  Created by Raúl Gallego Alonso on 31/5/24.
//

import SwiftUI

struct SwiftUIView2: View {
    var body: some View {
        NavigationStack { // esto hace que no llegue la lista del formulario a solapar por el reloj.
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
            .navigationTitle("SwiftUI") // y eso lo ponemos aqui en las segundas llaves, dependiendo de los 'section' tengamos hechos y hace poner un titulo al 'NavigationStack'.
            .navigationBarTitleDisplayMode(.inline) // esto hace poner el titulo mas pequeño en medio
        }
    }
}


#Preview {
    SwiftUIView2()
}
