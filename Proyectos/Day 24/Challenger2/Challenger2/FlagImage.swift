//
//  FlagImage.swift
//  Challenger2
//
//  Created by Raúl Gallego Alonso on 29/7/24.
//

import SwiftUI

struct FlagImage: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 2))
            .shadow(color: .black, radius: 2)
    }
}
