//
//  ContentView.swift
//  segmentedControl
//
//  Created by Raúl Gallego Alonso on 4/6/24.
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
                //creamos una nueva seccion con un texto y dentro del el otra seleccion con la constante de porcentaje de 10,15,20,etc etc, mirar arriba el let 👆.
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            /* la linea de arriba: itera sobre la colección tipPercentages.
                             Genera una vista para cada elemento en la colección.
                             Usa el propio valor del elemento como su identificador único, lo que es apropiado cuando los elementos son únicos y conforman el protocolo Hashable '$'.*/
                            Text($0, format: .percent)
                            // es un closure que especifica que el valor debe ser formateado como un porcentaje.
                        }
                    }
                    .pickerStyle(.segmented) //Este modificador aplica el estilo segmentado a un Picker. lo pone como en una barra si lo comnetas se vera el desplegable.
                }
                Section {
                    Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
