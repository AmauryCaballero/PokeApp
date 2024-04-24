//
//  HomeScreenViewModel.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import Foundation
import SwiftUI
import Combine

class HomeScreenViewModel: BaseViewModel {
    @Published var searchedPokemons: [NamedAPIResource] = []
    @Published var pokemons: [NamedAPIResource] = []
    @Published var pokemonDetails: [String: PokemonDetail] = [:]
    @Published var pokemonColors: [String: Color] = [:]
    @Published var searchTerm = ""
    
    private var offset = 0
    private let limit = 10
    
    override init(networkService: any NetworkServiceProtocol) {
        super.init(networkService: networkService)
        loadMoreContentIfNeeded(currentItem: nil)
        setupSearch()
    }
    
    func loadMoreContentIfNeeded(currentItem pokemon: NamedAPIResource?) {
        guard let pokemon = pokemon else {
            loadPokemons()
            return
        }
        
        let thresholdIndex = pokemons.index(pokemons.endIndex, offsetBy: -5)
        if pokemons.firstIndex(where: { $0.name == pokemon.name }) == thresholdIndex {
            loadPokemons()
        }
    }
    
    func loadPokemonDetails(for pokemon: NamedAPIResource) {
        guard pokemonDetails[pokemon.name] == nil else { return }
        
        networkService.fetchPokemonDetails(url: pokemon.url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error loading details for \(pokemon.name): \(error)")
                }
            }, receiveValue: { [weak self] details in
                guard let self = self else { return }
                self.pokemonDetails[pokemon.name] = details
                self.loadPokemonColor(for: pokemon)
            })
            .store(in: &cancellables)
    }
    
    
    private func setupSearch() {
        $searchTerm
            .removeDuplicates()
            .debounce(for: .milliseconds(200), scheduler: RunLoop.main)
            .flatMap { searchTerm in self.performSearch(searchTerm)}
            .receive(on: DispatchQueue.main)
            .assign(to: &$searchedPokemons)
    }
    
    private func performSearch(_ searchTerm: String) ->  AnyPublisher<[NamedAPIResource], Never> {
        guard !searchTerm.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            self.searchedPokemons = []
            return Just([]).eraseToAnyPublisher()
        }
        
        return Just(pokemons.filter {
            $0.name.localizedCaseInsensitiveContains(searchTerm)
        })
        .eraseToAnyPublisher()
        
        // FIXME: The API does not allow to do a search by partial name, so I will limit this function to searching for pokemons that are already local.
        /* networkService.searchPokemonByName(name: searchTerm.lowercased())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let failure) = completion {
                    print("ERROR searching: \(failure.localizedDescription)")
                }
            },
                  receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.searchedPokemons.append(response)
            })
            .store(in: &cancellables)
         */
    }
    
    private func loadPokemonColor(for pokemon: NamedAPIResource) {
        guard let pokemonDetails = pokemonDetails[pokemon.name] else { return }
        
        networkService.fetchPokemonColor(id: pokemonDetails.id ?? 0)
            .receive(on: DispatchQueue.main)
            .map {
                Color.named($0.name)
            }
            .sink(receiveCompletion: { completion in
                if case .failure(let failure) = completion {
                    print("\(String(describing: pokemonDetails.name)) \(String(describing: pokemonDetails.id)): \(failure.localizedDescription)")
                }
            },receiveValue: { [weak self] color in
                withAnimation {
                    self?.pokemonColors[pokemon.name] = color
                }
            })
            .store(in: &cancellables)
    }
    
    private func loadPokemons() {
        guard !isLoading else { return }
        isLoading = true
        
        networkService.fetchPokemonList(limit: limit, offset: offset)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                guard let self = self else { return }
                self.isLoading = false
                if case .failure(let error) = completion {
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                guard let self = self else { return }
                self.pokemons.append(contentsOf: response.results)
                self.offset += self.limit
            })
            .store(in: &cancellables)
    }
    
}

extension HomeScreenViewModel {
    static func preview() -> HomeScreenViewModel {
        let viewmodel = HomeScreenViewModel(networkService: NetworkService())
        return viewmodel
    }
}
