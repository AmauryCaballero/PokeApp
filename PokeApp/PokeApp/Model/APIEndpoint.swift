//
//  APIEndpoint.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Foundation

enum APIEndpoint {
    case pokemonList
    case pokemonDetail(String)
    
    var url: URL {
        switch self {
        case .pokemonList:
            return APIConfig.baseURL.appendingPathComponent("pokemon")
        case .pokemonDetail(let id):
            return APIConfig.baseURL.appendingPathComponent("pokemon/\(id)")
        }
    }
}
