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
        
        
        return container
    }()
    
    func resolve<T>(_ type: T.Type) -> T? {
        return container.resolve(type)
    }
}
