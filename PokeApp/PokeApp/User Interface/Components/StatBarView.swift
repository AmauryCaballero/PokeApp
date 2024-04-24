//
//  StatBarView.swift
//  PokeApp
//
//  Created by Amaury Caballero on 24/4/24.
//

import SwiftUI

struct StatBarView: View {
    var baseStat: Int
    var effort: Int
    var color: Color
    var totalSegments: Int = 15
    
    let maxValue: Int = 251

    var body: some View {
        HStack(spacing: 4) {
            ForEach(0..<totalSegments, id: \.self) { index in
                Capsule()
                    .fill((index < totalSegments * baseStat / maxValue ? color : Color.gray.opacity(0.5)).gradient)
                    .frame(width: 12, height: 25)
                    .overlay(
                        index < totalSegments * effort / 252 ? Rectangle().foregroundColor(Color.yellow).opacity(0.8) : nil
                    ).rotationEffect(Angle(degrees: 20))
            }
        }
    }
}

#Preview {
    StatBarView(baseStat: 10, effort: 20, color: .orange)
}
