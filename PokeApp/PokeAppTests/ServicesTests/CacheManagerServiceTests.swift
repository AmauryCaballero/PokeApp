//
//  CacheManagerServiceTests.swift
//  PokeAppTests
//
//  Created by Amaury Caballero on 26/4/24.
//

import Foundation
import XCTest
@testable import PokeApp

class CacheManagerServiceTests: XCTestCase {
    var cacheManager: CacheManager!

    override func setUpWithError() throws {
        super.setUp()
        cacheManager = CacheManager()
    }

    override func tearDownWithError() throws {
        cacheManager = nil
        super.tearDown()
    }

    func testSetAndGetItem() throws {
        // Create a species resource
        let species = NamedAPIResource(name: "pikachu-species", url: URL(string: "https://pokeapi.co/api/v2/pokemon-species/25/")!)
        
        // Create a Pokemon with all required parameters
        let pokemon = Pokemon(id: 25, name: "Pikachu", baseExperience: 112, height: 4, isDefault: true, order: 1, weight: 60, species: species)
        let key = "pokemon_Pikachu"

        // Store in cache
        cacheManager.set(pokemon, for: key)

        // Retrieve from cache
        let cachedPokemon: Pokemon? = cacheManager.get(for: key)

        // Verify
        XCTAssertNotNil(cachedPokemon, "The object retrieved from cache should not be nil.")
        XCTAssertEqual(cachedPokemon?.id, pokemon.id, "The ID of the retrieved Pokemon should match the one that was stored.")
        XCTAssertEqual(cachedPokemon?.name, pokemon.name, "The name of the retrieved Pokemon should match the one that was stored.")
    }

    func testCacheFetch() throws {
        let species = NamedAPIResource(name: "bulbasaur-species", url: URL(string: "https://pokeapi.co/api/v2/pokemon-species/1/")!)
        let pokemon = Pokemon(id: 1, name: "Bulbasaur", baseExperience: 64, height: 7, isDefault: true, order: 1, weight: 69, species: species)
        let key = "pokemon_Bulbasaur"

        // Store in cache
        cacheManager.set(pokemon, for: key)

        // Attempt to retrieve after expiration
        let expiredPokemon: Pokemon? = cacheManager.get(for: key)

        // Verify
        XCTAssertNotNil(expiredPokemon, "The object should not be nil.")
    }
}
