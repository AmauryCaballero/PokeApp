//
//  HomeScreenView+Components.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI
import SDWebImageSwiftUI

extension HomeScreenView {
    
    @ViewBuilder
    var header: some View {
        VStack(alignment: .leading) {
            Text("Search Your")
                .pokeFont(.title2)
            
            
            Text("Pokémon")
                .pokeFont(.title)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    var searchBar: some View {
        TextField("Search a Pokémon", text: $viewModel.searchTerm)
            .padding(7)
            .padding(.horizontal, 30)
            .background(RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 2)
                .fill(themeManager.currentTheme.background)
            ) .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    Spacer()
                }
            )
    }
    
    @ViewBuilder
    var background: some View {
        ZStack {
            BouncingCirclesView(circles: [
                BouncingCircle(color: themeManager.currentTheme.accent, diameter: 320, position: CGPoint(x: 150, y: 150), velocity: CGPoint(x: 2, y: 2)),
                BouncingCircle(color: themeManager.currentTheme.secondary, diameter: 180, position: CGPoint(x: 150, y: 150), velocity: CGPoint(x: -2, y: 2)),
                BouncingCircle(color: themeManager.currentTheme.primary, diameter: 180, position: CGPoint(x: 150, y: 150), velocity: CGPoint(x: 2, y: -2))
            ])
            .ignoresSafeArea(.all)
            .blur(radius: 100)
            
            PokeBallShape()
                .fill(.thinMaterial)
                .offset(x: 30)
                .aspectRatio(0.6, contentMode: .fill)
        }
    }
    
    
    @ViewBuilder
    func infiniteScroll(_ pokemons: [NamedAPIResource]) -> some View {
        let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
        
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: gridItems, spacing: 10) {
                if !pokemons.isEmpty {
                    
                    ForEach(pokemons, id: \.self) { pokemon in
                        let pokeColor = viewModel.pokemonColors[pokemon.name]
                        
                        Button(action: {viewModel.selectPokemon(pokemon)}) {
                            VStack {
                                pokeLabel(pokemon)
                                    .padding(.top, 5)
                                
                                Spacer()
                                
                                HStack {
                                    
                                    if let types = viewModel.pokemonDetails[pokemon.name]?.types {
                                        typesList(types)
                                    }
                                    
                                    HStack(alignment: .bottom) {
                                        Spacer()
                                        pokeImage(pokemon, pokeColor: pokeColor)
                                            .frame(width: 80, height: 80)
                                    }
                                }
                                .onAppear {
                                    viewModel.loadPokemonDetails(for: pokemon)
                                }
                                
                            }
                        }
                        .accentColor(themeManager.currentTheme.text)
                        .frame(height: 120)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill((pokeColor ?? themeManager.currentTheme.accent).gradient)
                                .opacity(0.8)
                                .padding(.horizontal, 2)
                        )
                        .onAppear {
                            viewModel.loadMoreContentIfNeeded(currentItem: pokemon)
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func typesList(_ types: [PokemonType]) -> some View {
        VStack(alignment: .leading) {
            ForEach(types) { type in
                
                HStack {
                    Text(type.type.name.capitalized)
                        .pokeFont(.footNote)
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 2)
                .background(
                    Capsule()
                        .fill(.thinMaterial)
                )
            }
        }
        .minimumScaleFactor(0.8)
        .padding()
    }
    
    
    @ViewBuilder
    private func pokeLabel(_ pokemon: NamedAPIResource) -> some View {
        HStack {
            Text(pokemon.name.capitalized)
                .pokeFont(.body)
                .bold()
                .multilineTextAlignment(.center)
            Spacer()
            
            Text("#\(viewModel.pokemonDetails[pokemon.name]?.id ?? 0)")
                .pokeFont(.footNote)
        }
        .padding()
    }
    
    @ViewBuilder
    private func pokeImage(_ pokemon: NamedAPIResource, pokeColor: Color?) -> some View {
        ZStack {
            Circle()
                .fill(.ultraThinMaterial)
                .overlay {
                    if let details = viewModel.pokemonDetails[pokemon.name],
                       let url = details.sprites?.frontDefault {
                        WebImage(url: url)
                            .resizable()
                            .indicator(.activity)
                        
                    } else {
                        ProgressView()
                    }
                }
            
        }
    }
    
}

