//
//  APIEndpoint.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Foundation

enum APIEndpoint {
    case pokemonList(limit: Int, offset: Int)
    case pokemonDetail(Int)
    case pokemonByName(String)

    var url: URL {
        switch self {
        case .pokemonList(let limit, let offset):
            var components = URLComponents(url: APIConfig.baseURL.appendingPathComponent("pokemon"), resolvingAgainstBaseURL: true)!
            components.queryItems = [
                URLQueryItem(name: "limit", value: String(limit)),
                URLQueryItem(name: "offset", value: String(offset))
            ]
            return components.url!
        case .pokemonDetail(let id):
            return APIConfig.baseURL.appendingPathComponent("pokemon/\(id)")
        case .pokemonByName(let name):
            return APIConfig.baseURL.appendingPathComponent("pokemon/\(name)")
        }
    }
}
