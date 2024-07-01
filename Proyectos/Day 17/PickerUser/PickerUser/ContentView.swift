//
//  ContentView.swift
//  PickerUser
//
//  Created by Raúl Gallego Alonso on 28/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2   // enlaces bidirecccionales, vistas que pueden ir cambiando.
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
            //.pickerStyle(.navigationLink) //esto y junto al 'NavigationStack' genera la lista que se desplaza hacia la derecha "otra pantalla", y asi podemos selecionar el numero de personas. 👉Esto se llama enlace de navegacion
            
            .navigationTitle("WeSplit") // Dependiendo donde pongamos esto, no se mostrara el titulo.
            
            /*Consejo ⚠️: Es tentador pensar que el modificador debe adjuntarse al final de la 'NavigationStack', pero debe adjuntarse al final del 'Form'. La razón es que las pilas de navegación son capaces de mostrar muchas vistas a medida que se ejecuta su programa, por lo que al adjuntar el título a la cosa dentro de la pila de navegación estamos permitiendo que iOS cambie los títulos libremente.*/
        }
    }
}

#Preview {
    ContentView()
}

/// **Por que por defecto salen 4 personas:**
/// Por que pusismos un operador de rango de 2 hasta 100(sin incluir el 100) y con el numero de personas parte de 2(@State private var numberOfPeople = 2) 👀 mirar ejemplo para entenderlo mejor
/*
 numero de personas por posicion - 0, 1, 2
 Numero de donde parte el Rango -  2, 3, 4, por eso por defecto sale 4
 */
