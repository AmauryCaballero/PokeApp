//
//  PokemonSpecies.swift
//  PokeApp
//
//  Created by Amaury Caballero on 25/4/24.
//

import Foundation

struct PokemonSpecies: Codable {
    let id: Int
    let name: String
    let evolutionChain: EvolutionChainLink

    enum CodingKeys: String, CodingKey {
        case id, name
        case evolutionChain = "evolution_chain"
    }
}

struct EvolutionChainLink: Codable {
    let url: String
}
