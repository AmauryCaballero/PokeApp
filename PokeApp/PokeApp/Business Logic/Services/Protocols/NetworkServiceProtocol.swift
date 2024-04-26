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
    
    func fetchEvolutionChain(from url: URL) -> AnyPublisher<EvolutionChain, Error>
    
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
    
    /// Fetches the color of a specific Pokemon by its unique identifier.
    /// - Parameter id: The unique identifier of the Pokemon.
    /// - Returns: An `AnyPublisher` that outputs `PokemonColor` and errors out with `Error`.
    /// This method retrieves all relevant details for a Pokemon, name by its `id`, from the Pokemon API.
    func fetchPokemonColor(id: Int) -> AnyPublisher<PokemonColor, Error>
    
    /// Fetches detailed information about a specific Pokemon by its unique identifier.
    /// - Parameter id: The unique identifier of the Pokemon.
    /// - Returns: An `AnyPublisher` that outputs `PokemonDetail` and errors out with `Error`.
    /// This method retrieves all relevant details for a Pokemon, identified by its `id`, from the Pokemon API.
    func fetchPokemonDetails(id: Int) -> AnyPublisher<PokemonDetail, Error>
    
    /// Searches for Pokemon by their name.
    /// - Parameter name: The name of the Pokemon to search for.
    /// - Returns: An `AnyPublisher` that outputs `PokemonListResponse` and errors out with `Error`.
    /// This method searches the Pokemon API for a Pokemon by its name and returns the result in a list format, which might include similar named Pokemon.
    func searchPokemonByName(name: String) -> AnyPublisher<PokemonListResponse, Error>
}
