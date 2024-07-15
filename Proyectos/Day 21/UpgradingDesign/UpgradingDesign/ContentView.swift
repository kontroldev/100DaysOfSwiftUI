//
//  ContentView.swift
//  UpgradingDesign
//
//  Created by Raúl Gallego Alonso on 15/7/24.
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
            /* LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom) // Desglose explicacion mas abajo. ⬇️*/
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45),location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea() // elimina los bordes blancos para pintarlos todos.
            
            VStack {
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                
                VStack(spacing: 15) {  //ponemos esta vista vereticar dentro de la otra vista vertical para contorlar mejor los espacios entre puento.
                    
                    VStack {
                        Spacer()
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            
                            .font(.largeTitle.weight(.semibold))
                        // Esto genera una fuenta con un titulo grande y con un groso en especifico
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule) //recortar una vista a la forma especificada. Esto significa que solo la parte de la vista que cae dentro de la forma especificada será visible; el resto se recortará.
                                .shadow(radius: 5)
                        }
                    }
                }
                //Esta vista genera el cuadrado blanco de las banderas.
                .frame(maxWidth:  .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                //Esto genera la vista del texto de abajo del todo.
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
        }
        
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is ???")
        }
    }
    
    //📌 ⬇️ Aqui esta toda la logica de la App.
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


/// **Explicacion de la linea**

/*Desglose de LinearGradient
 
 LinearGradient
 
 LinearGradient es una estructura en SwiftUI que define un gradiente lineal, un cambio gradual de un color a otro a lo largo de una línea recta.
 
 colors: [.blue, .black]
 
 Este parámetro especifica los colores que se utilizarán en el gradiente. En este caso, el gradiente comenzará con el color azul (.blue) y terminará con el color negro (.black).
 
 startPoint: .top
 
 Este parámetro especifica el punto de inicio del gradiente. .top indica que el gradiente comenzará desde la parte superior de la vista.
 
 endPoint: .bottom
 
 Este parámetro especifica el punto final del gradiente. .bottom indica que el gradiente terminará en la parte inferior de la vista.*/
