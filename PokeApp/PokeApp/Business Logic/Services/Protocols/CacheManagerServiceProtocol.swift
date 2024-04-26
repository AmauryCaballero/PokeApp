//
//  CacheServiceProtocol.swift
//  PokeApp
//
//  Created by Amaury Caballero on 26/4/24.
//

protocol CacheManagerServiceProtocol {
    func get<T: Codable>(for key: String) -> T?
    func set<T: Codable>(_ item: T, for key: String)
}
