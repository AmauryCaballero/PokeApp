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
    func pokemonImage(_ pokemon: PokemonDetail) -> some View {
        WebImage(url: pokemon.sprites?.frontDefault)
            .resizable()
            .frame(width: UIScreen.main.bounds.width)
            .aspectRatio(1, contentMode: .fit)
    }
}
