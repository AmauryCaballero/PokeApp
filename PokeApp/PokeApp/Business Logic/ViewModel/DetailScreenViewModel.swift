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
    
    override init(networkService: any NetworkServiceProtocol, navigationParameters: NavigationParameters? = nil) {
        super.init(networkService: networkService, navigationParameters: navigationParameters)
        
        if let pokemon: PokemonDetail = navigationParameters?.getValue(NavigationParametersKeys.pokemonDetail.rawValue)  {
            self.pokemonDetails = pokemon
        }
        
        if let color: Color = navigationParameters?.getValue(NavigationParametersKeys.pokemonColor.rawValue) {
            self.pokemonColor = color
        }
    }
}
