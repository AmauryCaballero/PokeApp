//
//  CacheServiceProtocol.swift
//  PokeApp
//
//  Created by Amaury Caballero on 26/4/24.
//

protocol CacheManagerServiceProtocol {
    func get<T: Decodable>(for key: String) -> T?
    func set<T: Decodable>(_ item: T, for key: String)
}
