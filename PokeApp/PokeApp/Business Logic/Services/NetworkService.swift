//
//  NetworkService.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import Alamofire
import Combine
import Foundation

class NetworkService: NetworkServiceProtocol {

    private var session: Session
    private var cache: CacheManagerServiceProtocol

    // Injecting Alamofire session for flexibility and testability
    init(session: Session = AF, cache: CacheManagerServiceProtocol) {
        self.session = session
        self.cache = cache
    }
    
    func fetchEvolutionChain(from url: URL) -> AnyPublisher<EvolutionChain, any Error> {
        return request(url)
    }
    
    func fetchPokemonSpecies(name: String) -> AnyPublisher<PokemonSpecies, any Error> {
        let endpoint = APIEndpoint.pokemonSpecies(name)
        let url = endpoint.url
        return request(url)
    }
    
    func fetchPokemonColor(id: Int) -> AnyPublisher<PokemonColor, any Error> {
        let endpoint = APIEndpoint.pokemonColor(id)
        let url = endpoint.url
        return request(url)
    }
    
    func fetchPokemonDetails(url: URL) -> AnyPublisher<PokemonDetail, any Error> {
        return request(url)
    }
    
    func fetchPokemonList(limit: Int = 20, offset: Int = 0) -> AnyPublisher<PokemonListResponse, Error> {
        let endpoint = APIEndpoint.pokemonList(limit: limit, offset: offset)
        let url = endpoint.url
        return request(url)
    }

    func fetchPokemonDetails(id: Int) -> AnyPublisher<PokemonDetail, Error> {
        let endpoint = APIEndpoint.pokemonDetail(id)
        let url = endpoint.url
        return request(url)
    }

    func searchPokemonByName(name: String) -> AnyPublisher<PokemonListResponse, Error> {
        let endpoint = APIEndpoint.pokemonByName(name)
        let url = endpoint.url
        return request(url)
    }

    private func request<T: Decodable>(_ url: URL, method: HTTPMethod = .get, parameters: Parameters? = nil) -> AnyPublisher<T, Error> {
        
        let key = "\(method.rawValue)\(url.absoluteString)"
        
        if let cachedData: T = cache.get(for: key) {
            return Just(cachedData)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return session.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .mapError { $0 as Error }
            .handleEvents(receiveOutput: { [weak self] response in
                self?.cache.set(response, for: key)
            })
            .eraseToAnyPublisher()
    }
}
