//
//  ContentView.swift
//  BuldingBasicLayout
//
//  Created by Raúl Gallego Alonso on 8/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("when do you want to wake up?")
                    .font(.headline) // es uno de los estilos de texto que SwiftUI ofrece, diseñado para ser utilizado en encabezados o subtítulos importantes dentro de la interfaz de usuario
                
                DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden() // se utiliza para ocultar las etiquetas asociadas con ciertos controles de entrada de datos.
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                
                Text("Daily coffee intake")
                    .font(.headline)
                
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
        }
    }
    
    func calculateBedtime() {
        
    }
}

#Preview {
    ContentView()
}
