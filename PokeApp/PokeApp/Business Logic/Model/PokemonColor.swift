//
//  PokemonColor.swift
//  PokeApp
//
//  Created by Amaury Caballero on 23/4/24.
//

import Foundation

struct PokemonColor: Codable {
    let id: Int
    let name: String
    let names: [PokemonColorName]
    let pokemonSpecies: [NamedAPIResource]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case names
        case pokemonSpecies = "pokemon_species"
    }

    struct PokemonColorName: Codable {
        let name: String
        let language: PokemonLanguage
    }

    struct PokemonLanguage: Codable {
        let name: String
        let url: URL
    }
}
