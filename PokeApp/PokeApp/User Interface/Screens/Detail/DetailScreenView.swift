//
//  DetailScreenView.swift
//  PokeApp
//
//  Created by Amaury Caballero on 24/4/24.
//

import SwiftUI
struct DetailScreenView: View {
    @ObservedObject var viewModel: DetailScreenViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationView {
            
            ZStack {
                if let pokemonInfo = viewModel.pokemonDetails {
                    backgroundImage(pokemonInfo)
                    
                    ScrollView {
                        
                        VStack(spacing: 10) {
                            pokemonImage(pokemonInfo)
                            
                            Text(pokemonInfo.name?.capitalized ?? "")
                                .pokeFont(.title)
                            
                            
                        }
                        
                    }
                    
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .navigationBarItems(
                leading:
                    Button(action: {presentationMode.wrappedValue.dismiss()})
                {
                    Image(systemName: "chevron.down")
                }
            )
        }
        
    }
}
