//
//  DetailScreenViewModel.swift
//  PokeApp
//
//  Created by Amaury Caballero on 24/4/24.
//

import Foundation

class DetailScreenViewModel: BaseViewModel {
    
    @Published var text: String = ""
    
    override init(networkService: any NetworkServiceProtocol, navigationParameters: NavigationParameters? = nil) {
        super.init(networkService: networkService, navigationParameters: navigationParameters)
        
        text = navigationParameters.debugDescription
    }
}
