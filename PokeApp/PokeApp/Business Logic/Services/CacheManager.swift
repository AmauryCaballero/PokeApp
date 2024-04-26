//
//  CacheManager.swift
//  PokeApp
//
//  Created by Amaury Caballero on 26/4/24.
//

import Foundation
import Cache

class CacheManager: CacheManagerServiceProtocol {
    private let storage: Storage<String, Data>

    init() {
        let diskConfig = DiskConfig(name: "PokeAppCache")
        let memoryConfig = MemoryConfig(expiry: .seconds(300), countLimit: 50, totalCostLimit: 10)
        
        storage = try! Storage(
            diskConfig: diskConfig,
            memoryConfig: memoryConfig,
            transformer: TransformerFactory.forData()
        )
    }

    func get<T: Decodable>(for key: String) -> T? {
        do {
            let data = try storage.object(forKey: key)
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            print("Failed to decode or retrieve from cache: \(error)")
            return nil
        }
    }

    func set<T: Decodable>(_ item: T, for key: String) {
        do {
            if let encodableItem = item as? Encodable {
                let data = try JSONEncoder().encode(encodableItem)
                try storage.setObject(data, forKey: key)
            }
        } catch {
            print("Failed to encode or save to cache: \(error)")
        }
    }
}
