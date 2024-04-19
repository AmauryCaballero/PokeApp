//
//  PokemonDetail.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Foundation

struct PokemonDetail: Codable {
    let abilities: [PokemonAbility]
    let forms: [NamedAPIResource]
    let gameIndices: [VersionGameIndex]
    let heldItems: [PokemonHeldItem]
    let moves: [PokemonMove]
    let species: NamedAPIResource
    let stats: [PokemonStat]
    let types: [PokemonType]
}

struct PokemonAbility: Codable {
    let isHidden: Bool
    let slot: Int
    let ability: NamedAPIResource
}

struct VersionGameIndex: Codable {
    let gameIndex: Int
    let version: NamedAPIResource
}

struct PokemonHeldItem: Codable {
    let item: NamedAPIResource
    let versionDetails: [PokemonHeldItemVersion]
}

struct PokemonHeldItemVersion: Codable {
    let version: NamedAPIResource
    let rarity: Int
}

struct PokemonMove: Codable {
    let move: NamedAPIResource
    let versionGroupDetails: [PokemonMoveVersion]
}

struct PokemonMoveVersion: Codable {
    let moveLearnMethod: NamedAPIResource
    let versionGroup: NamedAPIResource
    let levelLearnedAt: Int
}

struct PokemonStat: Codable {
    let stat: NamedAPIResource
    let effort: Int
    let baseStat: Int
}

struct PokemonType: Codable {
    let slot: Int
    let type: NamedAPIResource
}
