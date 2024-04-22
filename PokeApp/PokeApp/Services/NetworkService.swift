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

    // Injecting Alamofire session for flexibility and testability
    init(session: Session = AF) {
        self.session = session
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
        return session.request(url, method: method, parameters: parameters, encoding: URLEncoding.default)
            .validate()
            .publishDecodable(type: T.self)
            .value()
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
