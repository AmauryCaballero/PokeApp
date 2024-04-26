//
//  NetworkServiceProtocol.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Combine
import Foundation

/// Protocol `NetworkServiceProtocol` defines the networking capabilities for fetching Pokemon data from a remote server.
protocol NetworkServiceProtocol {
    
    /// Fetches the evolutionary chain of a Pokemon from a given URL.
    /// - Parameter url: The URL that points to the specific evolutionary chain resource.
    /// - Returns: An `AnyPublisher` that outputs `EvolutionChain` and errors out with `Error`.
    /// This method retrieves the complete evolutionary chain that includes all evolutionary stages of a Pokemon. This information is critical for understanding the different forms a Pokemon can take as it evolves.

    func fetchEvolutionChain(from url: URL) -> AnyPublisher<EvolutionChain, Error>
    
    /// Fetches detailed information about a specific Pokemon species by its name.
    /// - Parameter name: The name of the Pokemon species to retrieve.
    /// - Returns: An `AnyPublisher` that outputs `PokemonSpecies` and errors out with `Error`.
    /// This method retrieves all relevant details about a Pokemon species, identified by its name, from the Pokemon API. The response includes evolutionary data and various attributes of the species.
    func fetchPokemonSpecies(name: String) -> AnyPublisher<PokemonSpecies, Error>
    
    /// Fetches a list of Pokemon with pagination support.
    /// - Parameters:
    ///   - limit: The maximum number of Pokemon entries to return in one call.
    ///   - offset: The number of Pokemon entries to skip for pagination.
    /// - Returns: An `AnyPublisher` that outputs `PokemonListResponse` and errors out with `Error`.
    /// This method uses the Pokemon API to retrieve a list of Pokemon entities specifying how many entries to fetch and how many to skip.
    func fetchPokemonList(limit: Int, offset: Int) -> AnyPublisher<PokemonListResponse, Error>
    
    /// Fetches detailed information about a specific Pokemon by its unique identifier.
    /// - Parameter url: The unique url of the Pokemon.
    /// - Returns: An `AnyPublisher` that outputs `PokemonDetail` and errors out with `Error`.
    /// This method retrieves all relevant details for a Pokemon, identified by its `id`, from the Pokemon API.
    func fetchPokemonDetails(url: URL) -> AnyPublisher<PokemonDetail, Error>
    
    /// Fetches the color associated with a specific Pokemon by its unique identifier.
    /// - Parameter id: The unique identifier of the Pokemon whose color is to be retrieved.
    /// - Returns: An `AnyPublisher` that outputs `PokemonColor` and errors out with `Error`.
    /// This method retrieves the primary color of a Pokemon, which can be used for thematic or sorting purposes in applications.
    func fetchPokemonColor(id: Int) -> AnyPublisher<PokemonColor, Error>
    
    /// Fetches detailed information about a specific Pokemon by its unique identifier.
    /// - Parameter id: The unique identifier of the Pokemon.
    /// - Returns: An `AnyPublisher` that outputs `PokemonDetail` and errors out with `Error`.
    /// This method retrieves all relevant details for a Pokemon, identified by its `id`, including its abilities, base experience, forms, moves, and types from the Pokemon API.
    func fetchPokemonDetails(id: Int) -> AnyPublisher<PokemonDetail, Error>
    
    /// Searches for Pokemon by their name.
    /// - Parameter name: The name of the Pokemon to search for.
    /// - Returns: An `AnyPublisher` that outputs `PokemonListResponse` and errors out with `Error`.
    /// This method searches the Pokemon API for a Pokemon by its name and returns the result in a list format, which might include similar named Pokemon.
    func searchPokemonByName(name: String) -> AnyPublisher<PokemonListResponse, Error>
}
