//
//  ContentView.swift
//  BotonImagenes
//
//  Created by Raúl Gallego Alonso on 11/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        /*VStack {
         Button("Button 1") {}
         .buttonStyle(.bordered)
         
         Button("Button 2", role: .destructive) { }
         .buttonStyle(.bordered) // esto agrega un borde a la  vista.
         
         Button("Button 3", role: .destructive) { }
         .buttonStyle(.borderedProminent)
         .tint(.indigo)
         
         Button("Button 4", role: .destructive) { }
         .buttonStyle(.borderedProminent)*/
        
        
        // esto crea un boton rojo que cada vez que lo pulsas, parpadea.
        /* Button {
         print("Button was tapped")
         } label: {
         Text("Tap me!")
         .padding()
         .foregroundStyle(.white)
         .background(.red)*/
        
        Button {
            print("Button was tapped")
        } label: {
            Label("Edit", systemImage: "pencil")
                .padding()
                .foregroundStyle(.white)
                .background(.red)
        }
    }
    
    func executeDelete() {
        print("Now deleting...")
    }
}

#Preview {
    ContentView()
}
