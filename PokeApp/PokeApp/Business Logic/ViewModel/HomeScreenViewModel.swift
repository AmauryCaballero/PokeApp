//
//  HomeScreenViewModel.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import Foundation

class HomeScreenViewModel: BaseViewModel {
    
    @Published var pokemons: [NamedAPIResource] = []
    
    private var offset = 0
    private let limit = 20

    
    override init(networkService: any NetworkServiceProtocol) {
        super.init(networkService: networkService)
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
