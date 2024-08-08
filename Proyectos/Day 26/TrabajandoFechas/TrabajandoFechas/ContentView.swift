//
//  ContentView.swift
//  TrabajandoFechas
//
//  Created by Raúl Gallego Alonso on 31/7/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
    
    func exampleDate() { // Se define una función, que no toma parámetros y no devuelve ningún valor.

        /*Se crea una variable components de tipo DateComponents. DateComponents es una estructura que se utiliza para representar partes de una fecha, como el año, mes, día, hora, minuto, segundo, etc.*/
//        var componets = DateComponents()
        
        //Se asignan valores a los componentes de la fecha:
//        componets.hour = 8
//        componets.minute = 0
        
//        let date = Calendar.current.date(from: componets) ?? .now
        
        /* •Calendar.current.date(from: components) intenta crear un objeto Date a partir de los componentes proporcionados utilizando el calendario actual del sistema.
         • Calendar.current obtiene el calendario actual configurado en el sistema del usuario.
         • .date(from: components) convierte los DateComponents a un objeto Date.
         • El operador ?? proporciona un valor predeterminado en caso de que la conversión falle:
         • Si Calendar.current.date(from: components) devuelve nil (lo que puede suceder si los componentes no forman una fecha válida), se usa el valor predeterminado .now, que es la fecha y hora actual.*/
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
    }
}

#Preview {
    ContentView()
}
