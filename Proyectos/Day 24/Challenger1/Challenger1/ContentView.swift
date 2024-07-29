//
//  ContentView.swift
//  Challenger1
//
//  Created by Raúl Gallego Alonso on 28/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
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
                Section("How much do you want to tip?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented) //Este modificador aplica el estilo segmentado a un Picker. lo pone como en una barra si lo comnetas se vera el desplegable.
                }
                Section {
//                    if tipPercentage == 0
//                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//   ⚠️se puede hacer       .foregroundStyle(.red)
//      de las dos        } else {
//     maneras          Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
//                        .foregroundStyle(.black)
                    
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                }
                
                
            }
        }
        .navigationTitle("WeSplit")
    }
}
//}


#Preview {
    ContentView()
}
