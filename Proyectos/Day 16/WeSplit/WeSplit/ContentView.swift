//
//  ContentView.swift
//  WeSplit
//
//  Created by Raúl Gallego Alonso on 25/6/24.
//


//ContentView.swift contiene la interfaz de usuario inicial (UI) para la app, y es donde haremos todo el trabajo en este proyecto.

import SwiftUI

//'ContentView' crea una nueva estructura.
struct ContentView: View {
    // define una propiedad 'some View' y devolvera algo que se ajuste al protocolo View.
    // Es el protocolo básico que puede ser adoptado por cualquier cosa que desee dibujar en la pantalla: texto, los botones, las imágenes.
    
    //define una propiedad calculada, que tiene un tipo
    var body: some View { // el protocolo 'view' tiene como requisito que es que tenga una propiedad calculada de 'body'
        VStack {
            Image(systemName: "globe") //'globe' es una imagen que esta por defecto en swift entre otros.
            
            //'.imageScale()', '.foregroundStyle()' y '.padding()' son métodos que se llaman en la imagen y VStack. Esto es lo que SwiftUI llama un modificador.
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding() // escala la imagen estilo de primer plano y relleno
    }
}

#Preview {    // esto genera la vista de aqui 👉
    ContentView()
}


// Si pulsamos command + Option + P, es una tajo para refrescar la vista de la derecha. 👉
// y si queremos tener otra vista aqui ponemos #preview y el nombre de la otra vista que queremos ver.
