//
//  ContentView.swift
//  ChallengeDay
//
//  Created by Raúl Gallego Alonso on 2/7/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "Metros"
    @State private var outputUnit = "Metros"
    @State private var inputValue = ""
    
    let units = ["Metros", "Kilómetros", "Pies", "Yardas", "Millas"]
    
    // Función para convertir el valor de entrada a metros
    func convertToMeters(value: Double, unit: String) -> Double {
        switch unit {
        case "Metros":
            return value
        case "Kilómetros":
            return value * 1000
        case "Pies":
            return value * 0.3048
        case "Yardas":
            return value * 0.9144
        case "Millas":
            return value * 1609.34
        default:
            return value
        }
    }
    
    // Función para convertir metros a la unidad de salida deseada
    func convertFromMeters(value: Double, unit: String) -> Double {
        switch unit {
        case "Metros":
            return value
        case "Kilómetros":
            return value / 1000
        case "Pies":
            return value / 0.3048
        case "Yardas":
            return value / 0.9144
        case "Millas":
            return value / 1609.34
        default:
            return value
        }
    }
    
    var convertedValue: Double {
        let input = Double(inputValue) ?? 0
        let meters = convertToMeters(value: input, unit: inputUnit)
        return convertFromMeters(value: meters, unit: outputUnit)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Unidad de entrada")) {
                    Picker("Unidad de entrada", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                    TextField("Valor a convertir", text: $inputValue)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Unidad de salida")) {
                    Picker("Unidad de salida", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Resultado")) {
                    Text("\(convertedValue.formatted())")
                }
            }
            .navigationTitle("Conversor de Longitud")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
