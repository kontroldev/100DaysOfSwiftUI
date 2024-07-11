//
//  ContentView.swift
//  MensajesAlerta
//
//  Created by Raúl Gallego Alonso on 10/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var  showingAlert = false
    
    var body: some View {
        Button("Show alert") {
            showingAlert = true
        }
        .padding()
        
        //Esta alerta saldra despùes de pulsar el boton
        .alert("Important message", isPresented: $showingAlert) {
           //Button("OK") {}  // esto crea un boton de solo una opcion.
            Button("Delete", role: .destructive) {}
            Button("Cancel", role: .cancel) {}
        } message: { // esto genera un mensaje dentro de la alerta.
            Text("Please red this.")
        }
    }
}

#Preview {
    ContentView()
}
