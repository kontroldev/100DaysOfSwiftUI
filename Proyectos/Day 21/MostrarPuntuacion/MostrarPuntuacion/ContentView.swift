//
//  ContentView.swift
//  MostrarPuntuacion
//
//  Created by Raúl Gallego Alonso on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukranie", "US"].shuffled()
    // '.shuffled' se utiliza para crear una nueva colección con los elementos de la colección original ordenados de manera aleatoria.
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
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
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    func flagTapped(_ number: Int) { // esta funcion hace que tocas la bandera correcta
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}


#Preview {
    ContentView()
}
