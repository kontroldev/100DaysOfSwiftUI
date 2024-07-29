//
//  ContentView.swift
//  Challenge
//
//  Created by Raúl Gallego Alonso on 29/7/24.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Piedra", "Papel", "Tijeras"]
    @State private var appMove = Int.random(in: 0..<3)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var round = 1
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("Puntuación: \(score)")
                .font(.largeTitle)
                .padding()

            Spacer()

            Text("Movimiento de la App: \(moves[appMove])")
                .font(.largeTitle)

            Text(shouldWin ? "¡Ganar!" : "¡Perder!")
                .font(.title)
                .padding()

            Spacer()

            HStack {
                ForEach(0..<3) { number in
                    Button(action: {
                        self.playerMove(number)
                    }) {
                        Text(self.moves[number])
                            .font(.system(size: 35))
                            .padding()
                    }
                }
            }

            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Juego Terminado"),
                message: Text("Tu puntuación es \(score)"),
                dismissButton: .default(Text("OK"), action: resetGame)
            )
        }
    }

    func playerMove(_ number: Int) {
        if shouldWin {
            if (appMove == 0 && number == 1) || (appMove == 1 && number == 2) || (appMove == 2 && number == 0) {
                score += 1
            } else {
                score -= 1
            }
        } else {
            if (appMove == 0 && number == 2) || (appMove == 1 && number == 0) || (appMove == 2 && number == 1) {
                score += 1
            } else {
                score -= 1
            }
        }

        nextRound()
    }

    func nextRound() {
        if round >= 10 {
            showAlert = true
        } else {
            appMove = Int.random(in: 0..<3)
            shouldWin.toggle()
            round += 1
        }
    }

    func resetGame() {
        score = 0
        round = 1
        appMove = Int.random(in: 0..<3)
        shouldWin = Bool.random()
        showAlert = false
    }
}
#Preview {
    ContentView()
}
