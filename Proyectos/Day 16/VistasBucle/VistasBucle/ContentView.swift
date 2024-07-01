//
//  ContentView.swift
//  VistasBucle
//
//  Created by Raúl Gallego Alonso on 27/6/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"] // 'students no necesita estar marcada con '@State' porque es una constante; no va a cambiar.
    
    @State private var selectedStudent = "Harry"
    //La propiedad 'selectedStudent' tiene un valor "Harry", y puede cambiar, por eso está marcada con @State.
    
    
    var body: some View {
        NavigationStack {
            Form {
                //Crea una vista de selector que pide a los usuarios que seleccionen su favorito, utilizando un enlace bidireccional al @State
                Picker("Select your student", selection: $selectedStudent) {
                    
                    // 'ForEach' hacer un bucle sobre todos los posibles nombres de los estudiantes, convirtiéndolos en una vista de texto.
                    ForEach(students, id: \.self) {
                        
                //  ↗️ Indica que cada elemento en la colección se identifica de manera única por sí mismo 'id: \.self'.
                        Text($0)
                    }
                }
            }
            .navigationTitle("Select a Student")
        }
    }
}
#Preview {
    ContentView()
}
  

/// **Cuando se usa @state:**
//se usa para declarar propiedades que gestionan el estado dentro de una vista. Estas propiedades permiten que la vista reaccione y se actualice automáticamente cuando su valor cambia.
