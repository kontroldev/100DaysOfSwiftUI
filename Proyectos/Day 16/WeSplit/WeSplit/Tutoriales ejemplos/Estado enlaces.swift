//
//  Estado enlaces.swift
//  WeSplit
//
//  Created by Raúl Gallego Alonso on 31/5/24.
//

import SwiftUI

struct Estado_enlaces: View {
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Enter your name", text: $name) // $ 👇
            Text("Your name is \(name)")
        }
    }
}
/* que es $: es unbinding en SwiftUI es una conexión bidireccional entre una propiedad que almacena datos y una propiedad que lee y escribe esos datos. En otras palabras, permite que una vista lea y modifique una propiedad de estado ubicada en otra parte de la vista o en un modelo de datos.*/

#Preview {
    Estado_enlaces()
}
