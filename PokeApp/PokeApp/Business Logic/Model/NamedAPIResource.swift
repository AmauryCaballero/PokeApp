//
//  NamedAPIResource.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Foundation

struct NamedAPIResource: Codable, Hashable {
    let name: String
    let url: URL
}
