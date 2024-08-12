//
//  ContentView.swift
//  Challenger
//
//  Created by Raúl Gallego Alonso on 9/8/24.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfCups = 1
    @State private var bedtime = Date()
    
    var body: some View {
        Form {
            Section(header: Text("Number of Cups")) {
                Picker("Number of cups", selection: $numberOfCups) {
                    ForEach(1..<11) { number in
                        Text("\(number)").tag(number)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Bedtime")) {
                DatePicker("Select your bedtime", selection: $bedtime, displayedComponents: .hourAndMinute)
            }
            
            Section {
                Text("Recommended Bedtime: \(formattedRecommendedBedtime)")
                    .font(.largeTitle)
                    .padding()
            }
        }
    }
    
    private var formattedRecommendedBedtime: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        // Implement your logic to calculate the recommended bedtime based on numberOfCups and bedtime.
        // Here is a simplified example:
        let calendar = Calendar.current
        let sleepTime = calendar.date(byAdding: .hour, value: -numberOfCups, to: bedtime) ?? bedtime
        return formatter.string(from: sleepTime)
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
