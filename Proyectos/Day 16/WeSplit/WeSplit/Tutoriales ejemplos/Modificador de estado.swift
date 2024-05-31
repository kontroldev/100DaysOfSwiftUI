//
//  SwiftUIView.swift
//  WeSplit
//
//  Created by Raúl Gallego Alonso on 31/5/24.
//

import SwiftUI

struct SwiftUIView3: View {
    // 👇  es un atributo que se usa para declarar propiedades que representan el estado mutable de una vista. y nos permite evitar la limitacion de las estrcturas.
    // Esta diseñado especificamente para las propiedades simples.
   @State private var tapCount = 0
    // ⚠️Y apple recomienda que agreguemos el control de acceso 'private' a etas propiedades.
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    SwiftUIView3()
}
