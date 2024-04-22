//
//  ThemeManager.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import Foundation
import SwiftUI

class ThemeManager: ObservableObject {
    @Published var currentTheme: ColorTheme = .light
    @Environment(\.colorScheme) var colorScheme: ColorScheme {
        didSet {
            switch colorScheme {
            case .light:
                currentTheme = .light
            case .dark:
                currentTheme = .dark
            @unknown default:
                currentTheme = .dark
            }
        }
    }
    
    init() {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            currentTheme = .dark
        } else {
            currentTheme = .light
        }
    }
}
