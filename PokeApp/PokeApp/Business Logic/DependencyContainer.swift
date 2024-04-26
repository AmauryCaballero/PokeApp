//
//  DependencyContainer.swift
//  PokeApp
//
//  Created by Amaury Caballero on 23/4/24.
//

import Foundation
import Swinject

final class DependencyContainer {
    static let shared = DependencyContainer()
    
    let container: Container = {
        let container = Container()
        container.register(CacheManagerServiceProtocol.self) { _ in CacheManager()}
        
        container.register(NetworkServiceProtocol.self) { resolver in NetworkService(cache: resolver.resolve(CacheManagerServiceProtocol.self)!)}
        
        container.register(HomeScreenViewModel.self) { (resolver, _ : NavigationParameters?) in
            HomeScreenViewModel(networkService: resolver.resolve(NetworkServiceProtocol.self)!)
        }
        
        container.register(DetailScreenViewModel.self) { (resolver, parameters: NavigationParameters?) in
            let networkService = resolver.resolve(NetworkServiceProtocol.self)!
            return DetailScreenViewModel(networkService: networkService, navigationParameters: parameters)
        }
        
        return container
    }()
    
    func resolveViewModel<BaseViewModel>(_ baseViewModel: BaseViewModel.Type, parameters: NavigationParameters? = nil) -> BaseViewModel? {
        return container.resolve(baseViewModel, argument: parameters)
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
