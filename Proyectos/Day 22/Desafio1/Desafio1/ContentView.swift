//
//  ContentView.swift
//  Desafio1
//
//  Created by Raúl Gallego Alonso on 16/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukranie", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questionCount = 0

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            VStack {
                Text("Tap the flag of")
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
                    Image(self.countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 2)
                }
            }

            Text("Score: \(score)")
                .font(.title)
                .fontWeight(.black)

            Spacer()
        }
        .alert(isPresented: $showingScore) {
            if questionCount == 8 {
                return Alert(title: Text("Game Over"), message: Text("Your final score is \(score)"), dismissButton: .default(Text("Restart")) {
                    self.resetGame()
                })
            } else {
                return Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
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
