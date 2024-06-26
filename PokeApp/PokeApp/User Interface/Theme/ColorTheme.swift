//
//  ColorTheme.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI

struct ColorTheme: Equatable {
    let primary, secondary, background, text, accent: Color
    
    static let light = ColorTheme(
        primary: .red,
        secondary: Color(hex: "#41AAF7"),
        background: Color(hex: "#F7F7F7"),
        text: .black,
        accent: Color(hex: "#D9AE5A")
    )
    
    static let dark = ColorTheme(
        primary: .red,
        secondary: Color(hex: "#41AAF7"),
        background: Color(hex: "#232323"),
        text: .white,
        accent: Color(hex: "#D9AE5A")
    )
}
