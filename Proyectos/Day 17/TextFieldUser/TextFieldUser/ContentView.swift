//
//  ContentView.swift
//  TextFieldUser
//
//  Created by Raúl Gallego Alonso on 27/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 0] //Porcentaje de la propina
    
    var body: some View {
        Form {
            Section {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                // Esto genera la moneda en el pais en el que estas, acuerdate de la localizacion de calendario.
                
                    .keyboardType(.decimalPad)
                //Esto lo que hace crear un teclado decimal.
            }
            Section {
                Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
        }
    }
}


#Preview {
    ContentView()
}
