//
//  ColorTheme.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI

struct ColorTheme {
    let primary, secondary, background, text, accent: Color
    
    static let light = ColorTheme(
        primary: .red,
        secondary: Color(hex: "#ADDAEE"),
        background: Color(hex: "#232323"), 
        text: .black,
        accent: Color(hex: "#B2FFE2")
    )
    
    static let dark = ColorTheme(
        primary: .red,
        secondary: Color(hex: "#ADDAEE"),
        background: Color(hex: "#464646"),
        text: .white,
        accent: Color(hex: "#B2FFE2")
    )
}
