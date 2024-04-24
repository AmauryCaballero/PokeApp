//
//  PokemonDetail.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Foundation

struct PokemonDetail: Codable {
    let id: Int?
    let name: String?
    let baseExperience: Int?
    let height: Int?
    let isDefault: Bool?
    let order: Int?
    let weight: Int?
    let abilities: [PokemonAbility]?
    let forms: [NamedAPIResource]?
    let gameIndices: [VersionGameIndex]?
    let heldItems: [PokemonHeldItem]?
    let locationAreaEncounters: String?
    let moves: [PokemonMove]?
    let species: NamedAPIResource?
    let sprites: PokemonSprites?
    let stats: [PokemonStat]?
    let types: [PokemonType]?
}

struct PokemonAbility: Codable {
    let isHidden: Bool?
    let slot: Int?
    let ability: NamedAPIResource?
}

struct VersionGameIndex: Codable {
    let gameIndex: Int?
    let version: NamedAPIResource?
}

struct PokemonHeldItem: Codable {
    let item: NamedAPIResource?
    let versionDetails: [PokemonHeldItemVersion]?
}

struct PokemonHeldItemVersion: Codable {
    let version: NamedAPIResource?
    let rarity: Int?
}

struct PokemonMove: Codable {
    let move: NamedAPIResource?
    let versionGroupDetails: [PokemonMoveVersion]?
}

struct PokemonMoveVersion: Codable {
    let moveLearnMethod: NamedAPIResource?
    let versionGroup: NamedAPIResource?
    let levelLearnedAt: Int?
}

struct PokemonSprites: Codable {
    let frontDefault: URL?
    let frontShiny: URL?
    let backDefault: URL?
    let backShiny: URL?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontShiny = "front_shiny"
        case backDefault = "back_default"
        case backShiny = "back_shiny"
    }
}

struct PokemonStat: Codable {
    let stat: NamedAPIResource?
    let effort: Int?
    let baseStat: Int?
    
    enum CodingKeys: String, CodingKey {
        case stat = "stat"
        case effort = "effort"
        case baseStat = "base_stat"
    }
}

struct PokemonType: Codable, Identifiable{
    var id: Int { slot }

    let slot: Int
    let type: NamedAPIResource
}
