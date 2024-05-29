//
//  ContentView.swift
//  WeSplit
//
//  Created by Raúl Gallego Alonso on 29/5/24.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectdStudent = "Harry"
    
    var body: some View {
        Form {
            Picker("Select you student", selection: $selectdStudent) {
                ForEach(students, id: \.self) {
                    Text($0)
                }
            }
        }
        .navigationTitle("Select a Student")
    }
}

#Preview {
    ContentView()
}
