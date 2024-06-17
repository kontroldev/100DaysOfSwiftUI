//
//  ContentView.swift
//  OcultandoTeclado
//
//  Created by Raúl Gallego Alonso on 17/6/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountItFocused: Bool // añadimos una nueva propiedad para crear un boton.
    
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
                        .focused($amountItFocused) // Ahora podemos adjuntar eso a nuestro campo de texto, de modo que cuando el campo de texto esté enfocado, 'amountIsFocused' sea verdadero; de lo contrario, será falso.
                    
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
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountItFocused {
                    Button("Done") {
                        amountItFocused = false
                       /* 1.El modificador 'toolbar()' nos permite especificar elementos de la barra de herramientas para una vista. Estos elementos de la barra de herramientas pueden aparecer en varios lugares de la pantalla, como en la barra de navegación en la parte superior, en un área especial de la barra de herramientas en la parte inferior, y así sucesivamente.
                        
                        2.La condición verifica si `amountIsFocused` es actualmente verdadero, por lo que solo mostramos el botón cuando el campo de texto está activo.

                        3.La vista 'Button' que estamos utilizando aquí muestra un texto que se puede tocar, que en nuestro caso es "Done". También necesitamos proporcionarle algún código para ejecutar cuando se presione el botón, que en nuestro caso establece `amountIsFocused` en falso para que el teclado se oculte.*/
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
