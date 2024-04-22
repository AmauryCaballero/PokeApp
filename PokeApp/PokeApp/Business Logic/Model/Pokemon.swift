//
//  Pokemon.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Foundation

struct Pokemon: Codable {
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let isDefault: Bool
    let order: Int
    let weight: Int
    let species: NamedAPIResource
}
