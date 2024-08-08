//
//  ContentView.swift
//  fechaDatosPicker
//
//  Created by Raúl Gallego Alonso on 30/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    

    var body: some View {
        DatePicker("Please enter a date", selection: $wakeUp, in: Date.now...) // esto crea un calendari sin poder seleccionar dias posteriores al de dia.
        
                   //displayedComponents: .hourAndMinute)
        //'.displayedComponents'  solo muestra la selección de las horas y minutos, ignorando otros componentes como la fecha.
        
        //el método '.labelsHidden()' se utiliza para ocultar las etiquetas de los controles de selección, del DatePicker.
            .labelsHidden()
    }
    func exampleDates() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
}

#Preview {
    ContentView()
}
