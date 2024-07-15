//
//  ContentView.swift
//  ApilarBotones
//
//  Created by Raúl Gallego Alonso on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukranie", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack {
            Color.blue // pone color al fondo, por que es la primera interfaz.
                .ignoresSafeArea() // elimina los bordes blancos para pintarlos todos.
            
            VStack(spacing: 30) {  //ponemos esta vista vereticar dentro de la otra vista vertical para contorlar mejor los espacios entre puento.
                
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                        
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                ForEach(0..<3) { number in
                    Button {
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
