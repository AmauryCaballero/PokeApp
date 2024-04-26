//
//  CacheManager.swift
//  PokeApp
//
//  Created by Amaury Caballero on 26/4/24.
//

import Foundation

class CacheManager: CacheManagerServiceProtocol {
    private let cache = NSCache  <AnyObject, AnyObject>()
    
    func get<T>(for key: String) -> T? where T : Decodable {
        if let cachedObject = cache.object(forKey: key as AnyObject) as? T {
            return cachedObject
        }
        return nil
    }
    
    func set<T>(_ item: T, for key: String) where T : Decodable {
        cache.setObject(item as AnyObject, forKey: key as AnyObject)
    }
}
