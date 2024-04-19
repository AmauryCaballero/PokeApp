//
//  PokemonListResponse.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Foundation

struct PokemonListResponse: Codable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [NamedAPIResource]
}
