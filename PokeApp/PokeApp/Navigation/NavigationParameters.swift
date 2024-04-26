//
//  NavigationParameters.swift
//  PokeApp
//
//  Created by Amaury Caballero on 24/4/24.
//

import Foundation

struct NavigationParameters: Identifiable {
    var id: Int { keyValues.description.hashValue }
    var keyValues: [String: Any] = [:]
    
    init(_ parameters: [String: Any] = [:]) {
        self.keyValues = parameters
    }
    
    mutating func addParameter(_ key: String, value: Any) {
        keyValues[key] = value
    }
    
    func getValue<T>(_ key: String) -> T? {
        return keyValues[key] as? T
    }
}
