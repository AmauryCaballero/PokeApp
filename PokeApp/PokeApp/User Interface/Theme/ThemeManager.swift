//
//  ThemeManager.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import Foundation
import SwiftUI
import Combine

class ThemeManager: ObservableObject {
    @Published var currentTheme: ColorTheme = .light
    
    init() {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            currentTheme = .dark
        } else {
            currentTheme = .light
        }
    }
    
    func updateTheme(to theme: ColorTheme) {
        currentTheme = theme
    }
}
