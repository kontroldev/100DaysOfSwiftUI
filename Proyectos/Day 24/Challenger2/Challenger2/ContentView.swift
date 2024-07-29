//
//  ContentView.swift
//  Challenger2
//
//  Created by Raúl Gallego Alonso on 28/7/24.
//
import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "Francia", "Alemania", "Irlanda", "Italia", "Nigeria", "Polonia", "España", "Reino Unido", "Ucrania", "Estados Unidos"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCount = 0

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            VStack {
                Text("Toca la bandera de")
                    .font(.largeTitle)
                    .fontWeight(.black)

                Text(countries[correctAnswer])
                    .font(.largeTitle)
                    .fontWeight(.black)
            }

            ForEach(0..<3) { number in
                Button(action: {
                    self.flagTapped(number)
                }) {
                    FlagImage(imageName: self.countries[number])
                }
            }

            Text("Puntuación: \(score)")
                .font(.title)
                .fontWeight(.black)

            Spacer()
        }
        .alert(isPresented: $showingScore) {
            if questionCount == 8 {
                return Alert(title: Text("Juego Terminado"), message: Text("Tu puntuación final es \(score)"), dismissButton: .default(Text("Reiniciar")) {
                    self.resetGame()
                })
            } else {
                return Alert(title: Text(scoreTitle), message: Text("Tu puntuación es \(score)"), dismissButton: .default(Text("Continuar")) {
                    self.askQuestion()
                })
            }
        }
    }


    //aqui generamos toda la logica de la puntuacion
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong"
            score -= 1
            scoreTitle += "\nThat’s the flag of \(countries[number])"
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCount += 1
    }

    func resetGame() {
        score = 0
        questionCount = 0
        askQuestion()
    }
}


#Preview {
    ContentView()
}
