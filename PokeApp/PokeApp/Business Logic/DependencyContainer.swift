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
        
        container.register(NetworkServiceProtocol.self) { _ in NetworkService()}
        
        container.register(HomeScreenViewModel.self) { (resolver, parameters: [String: Any]?) in
            let networkService = resolver.resolve(NetworkServiceProtocol.self)!
            return HomeScreenViewModel(networkService: networkService, navigationParameters: parameters)
        }
        
        return container
    }()
    
    func resolveViewModel<BaseViewModel>(_ baseViewModel: BaseViewModel.Type, parameters: [String: Any]? = nil) -> BaseViewModel? {
        return container.resolve(baseViewModel, argument: parameters)
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
