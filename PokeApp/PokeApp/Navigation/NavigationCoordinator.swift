//
//  NavigationCoordinator.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import Foundation

class NavigationCoordinator: ObservableObject {
    @Published var currentPage: Page? = .home
    
    func navigateTo(page: Page) {
        self.currentPage = page
    }
}
