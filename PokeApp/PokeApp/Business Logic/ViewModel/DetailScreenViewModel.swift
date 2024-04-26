//
//  DetailScreenViewModel.swift
//  PokeApp
//
//  Created by Amaury Caballero on 24/4/24.
//

import Foundation
import SwiftUI

class DetailScreenViewModel: BaseViewModel {
    @Published var pokemonDetails: PokemonDetail?
    @Published var pokemonColor: Color?
    
    @Published var pokemonSpecies: PokemonSpecies?
    @Published var evolutionChain: EvolutionChain?
    
    override init(networkService: any NetworkServiceProtocol, navigationParameters: NavigationParameters? = nil) {
        super.init(networkService: networkService, navigationParameters: navigationParameters)
        
        if let pokemon: PokemonDetail = navigationParameters?.getValue(NavigationParametersKeys.pokemonDetail.rawValue)  {
            self.pokemonDetails = pokemon
            self.getEvolutionDetails(for: pokemonDetails?.name ?? "")
        }
        
        if let color: Color = navigationParameters?.getValue(NavigationParametersKeys.pokemonColor.rawValue) {
            self.pokemonColor = color
        }
        
        
        
    }
    
    private func getEvolutionDetails(for pokemonName: String) {
        networkService.fetchPokemonSpecies(name: pokemonName)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] species in
                guard let self = self else { return }
                self.pokemonSpecies = species
                
                guard let evolutionChainURL = URL(string: species.evolutionChain.url) else { return }
                self.fetchEvolutionChain(url: evolutionChainURL)
            })
    }
    
    private func fetchEvolutionChain(url: URL) {
        networkService.fetchEvolutionChain(from: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] chain in
                guard let self = self else { return }
                self.evolutionChain = chain
            })
    }
}
