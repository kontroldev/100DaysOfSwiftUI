//
//  ContentView.swift
//  ModificadoEstado
//
//  Created by Raúl Gallego Alonso on 26/6/24.
//

import SwiftUI

struct ContentView: View {
    // @State atributo que se usa para declarar propiedades que representan el estado mutable de una vista. y nos permite evitar la limitacion de las estrcturas.
    // Esta diseñado especificamente para las propiedades simples.
   @State private var tapCount = 0
    // ⚠️Y apple recomienda que agreguemos el control de acceso 'private' a etas propiedades.
    
    
    // la propiedad 'body' define la estructura visual de la misma.
    // 'some View' define la estructura visual de la vista.

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
