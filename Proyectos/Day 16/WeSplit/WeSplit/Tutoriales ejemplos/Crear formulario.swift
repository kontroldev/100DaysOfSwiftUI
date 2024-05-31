//
//  SwiftUIView.swift
//  WeSplit
//
//  Created by Raúl Gallego Alonso on 31/5/24.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
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
    }
}

#Preview {
    SwiftUIView()
}
