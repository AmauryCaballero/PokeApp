//
//  DetailScreenView+Components.swift
//  PokeApp
//
//  Created by Amaury Caballero on 24/4/24.
//

import SwiftUI
import SDWebImageSwiftUI


extension DetailScreenView {
    @ViewBuilder
    func backgroundImage(_ pokemon: PokemonDetail) -> some View {
        VStack {
            WebImage(url: pokemon.sprites?.backShiny)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.width)
                .scaleEffect(1.5)
                .grayscale(1.0)
                .blur(radius: 5)
                .opacity(0.5)
            
            Spacer()
                .background(.purple)
        }
    }
    
    @ViewBuilder
    func aboutTab(_ pokemonInfo: PokemonDetail) -> some View {
        HStack {
            Spacer()
            VStack(spacing: 5) {
                HStack {
                    Image(systemName: "platter.top.applewatch.case")
                    Text("\(pokemonInfo.weight ?? 0)kg")
                        .pokeFont(.body)
                        .bold()
                }
                Text("Weight")
                    .pokeFont(.footNote)
            }
            
            Spacer()
            
            Capsule()
                .frame(width: 2, height: 50)
                .padding(.vertical, 10)
                .foregroundColor(themeManager.currentTheme.text)
                
            Spacer()
            
            VStack(spacing: 5) {
                
                HStack {
                    Image(systemName: "arrow.up")
                    Text("\(pokemonInfo.height ?? 0)m")
                        .pokeFont(.body)
                        .bold()
                }
                
                Text("Height")
                    .pokeFont(.footNote)
            }
            
            Spacer()
        }
        .frame(alignment: .top)
        .padding(.horizontal, 15)
        .background(RoundedRectangle(cornerRadius: 15)
            .fill(.regularMaterial)
            .padding(.horizontal, 15)
        )
    }
    
    @ViewBuilder
    func tab(_ text: String) -> some View {
        Text(text)
            .pokeFont(.title2)
    }
    
    @ViewBuilder
    func pokemonImage(_ pokemon: PokemonDetail) -> some View {
        WebImage(url: pokemon.sprites?.frontDefault)
            .resizable()
            .frame(width: UIScreen.main.bounds.width)
            .aspectRatio(1, contentMode: .fit)
    }
}
