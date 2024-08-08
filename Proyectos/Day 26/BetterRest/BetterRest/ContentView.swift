//
//  ContentView.swift
//  BetterRest
//
//  Created by Raúl Gallego Alonso on 30/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        
        //' Stepper' es un control de interfaz de usuario que permite a los usuarios incrementar o decrementar un valor mediante botones de incremento y decremento
        
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
        /*el método 'formatted' se utiliza para dar formato a valores para su presentación. Este método es especialmente útil para convertir valores numéricos, fechas y otros tipos de datos en cadenas de texto con un formato específico.
*/
    }
}

#Preview {
    ContentView()
}
