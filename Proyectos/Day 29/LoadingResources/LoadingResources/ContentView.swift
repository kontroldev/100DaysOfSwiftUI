//
//  ContentView.swift
//  LoadingResources
//
//  Created by Raúl Gallego Alonso on 12/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }

      /// **Función para probar el acceso a archivos en el bundle:**
      // Esta función intenta cargar un archivo de texto desde el bundle de la aplicación
    func testBundles() {
        // Intenta obtener la URL del archivo "somefile.txt" en el bundle
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            // ¡Encontramos el archivo en nuestro paquete!
            
            // Intenta leer el contenido del archivo como una cadena
            if let fileContents = try? String(contentsOf: fileURL) {
                // ¡Cargamos el archivo en una cadena!/
            }
        }
        
        }
    }


#Preview {
    ContentView()
}
