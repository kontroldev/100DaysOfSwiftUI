//
//  ContentView.swift
//  ViewAndModifiers
//
//  Created by Raúl Gallego Alonso on 17/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        // Esto me pinta toda la parte de atras de hello world!
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
    }
}

#Preview {
    ContentView()
}
