//
//  ContentView.swift
//  PickerUser
//
//  Created by Raúl Gallego Alonso on 3/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
           // .pickerStyle(.navigationLink) //esto  y junto al 'NavigationStack' genera la lista que se desplace hacia la derecha, y asi podemos selecionar el numero de personas.
            .navigationTitle("WeSplit") // Dependiendo donde pongamos esto, no se mostrara el titulo.
        }
      
    }
}

#Preview {
    ContentView()
}
