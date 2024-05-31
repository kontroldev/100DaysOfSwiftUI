//
//  VistasBucle.swift
//  WeSplit
//
//  Created by Raúl Gallego Alonso on 31/5/24.
//

import SwiftUI

struct VistasBucle: View {
    @State private var name = ""
    
    
    var body: some View {
        Form {
            ForEach(0..<100) { number in
                Text("Row \(number)")
            }
        }
    }
}
#Preview {
    VistasBucle()
}
