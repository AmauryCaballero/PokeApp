//
//  EvolutionChain.swift
//  PokeApp
//
//  Created by Amaury Caballero on 25/4/24.
//

import Foundation

struct EvolutionChain: Codable {
    let id: Int
    let chain: EvolutionDetail
}

struct EvolutionDetail: Codable {
    let species: NamedAPIResource
    let evolvesTo: [EvolutionDetail]

    enum CodingKeys: String, CodingKey {
        case species
        case evolvesTo = "evolves_to"
    }
}
