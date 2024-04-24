//
//  HomeScreenView.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI

struct HomeScreenView: View {
    @ObservedObject var viewModel: HomeScreenViewModel
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                header
                
                searchBar
                if !viewModel.searchedPokemons.isEmpty {
                    infiniteScroll(viewModel.searchedPokemons)
                } else {
                    infiniteScroll(viewModel.pokemons)
                }
            }
            .padding(.horizontal, 50)
        }.fullScreenCover(item: $viewModel.parameters) { navigationParameters in
            let viewModel = DependencyContainer.shared.resolveViewModel(DetailScreenViewModel.self, parameters: navigationParameters)!
            DetailScreenView(viewModel: viewModel)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            HomeScreenView(viewModel: HomeScreenViewModel.preview())
                .previewDisplayName("Light Mode")
            
            
            HomeScreenView(viewModel: HomeScreenViewModel.preview())
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
