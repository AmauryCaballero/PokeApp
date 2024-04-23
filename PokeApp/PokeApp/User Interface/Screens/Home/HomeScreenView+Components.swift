//
//  HomeScreenView+Components.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI

extension HomeScreenView {
    
    @ViewBuilder
    var infiniteScroll: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.pokemons, id: \.self) { pokemon in
                    Text(pokemon.name)
                        .pokeFont(.button)
                        .onAppear {
                            viewModel.loadMoreContentIfNeeded(currentItem: pokemon)
                        }
                }
                if viewModel.isLoading {
                    ProgressView()
                }
            }
        }
        .onAppear {
            viewModel.loadMoreContentIfNeeded(currentItem: nil)
        }
    }
    
    @ViewBuilder
    var searchBar: some View {
        TextField("Search a Pokémon", text: .constant(""))
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
    var background: some View {
        ZStack {
            ZStack {
                Circle()
                    .fill(themeManager.currentTheme.accent)
                    .frame(height: 300)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .offset(x: 20, y: 100)
                
                Circle()
                    .fill(themeManager.currentTheme.secondary)
                    .frame(height: 180)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                
                Circle()
                    .fill(themeManager.currentTheme.primary)
                    .frame(height: 180)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                    .offset(y: 60)
                
            }
            .ignoresSafeArea(.all)
            .blur(radius: 100)
            
            PokeBallShape()
                .fill(.thinMaterial)
                .offset(x: 30)
                .aspectRatio(0.6, contentMode: .fill)
        }
    }
}
