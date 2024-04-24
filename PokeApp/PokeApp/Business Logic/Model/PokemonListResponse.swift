//
//  PokemonListResponse.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Foundation

struct PokemonListResponse: Codable {
    var count: Int
    var next: URL?
    var previous: URL?
    var results: [NamedAPIResource]
}
