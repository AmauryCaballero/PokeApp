//
//  BaseViewModel.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import Foundation
import Combine

open class BaseViewModel: ObservableObject {
    @Published public var isLoading = false
    
    let networkService: NetworkServiceProtocol
    
    var navigationParameters: NavigationParameters?
    var cancellables = Set<AnyCancellable>()
    
    init(networkService: NetworkServiceProtocol, navigationParameters: NavigationParameters? = nil) {
        self.navigationParameters = navigationParameters
        self.networkService = networkService
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    final func addCancellable(_ cancellable: AnyCancellable) {
        cancellables.insert(cancellable)
    }
    
    final func clearCancellables() {
        cancellables.removeAll()
    }
}
