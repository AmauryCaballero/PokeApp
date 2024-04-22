//
//  NetworkServiceProtocol.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Combine

protocol NetworkServiceProtocol {
    func fetchPokemonList(limit: Int, offset: Int) -> AnyPublisher<PokemonListResponse, Error>
    
    func fetchPokemonDetails(id: Int) -> AnyPublisher<PokemonDetail, Error>
    
    func searchPokemonByName(name: String) -> AnyPublisher<PokemonListResponse, Error>
}
