//
//  NetworkServiceProtocol.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Combine

protocol NetworkServiceProtocol {
    func fetchPokemonList(limit: Int, offset: Int) -> AnyPublisher<PokemonListResponse, Error>
    
    func fetchPokemonDetails(by name: String) -> AnyPublisher<PokemonDetail, Error>
    
    func searchPokemonByName(name: String) -> AnyPublisher<PokemonListResponse, Error>
    
    func advancedSearchPokemon(parameters: [String: Any]) -> AnyPublisher<PokemonListResponse, Error>
}
