//
//  HomeScreenView+Components.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI

extension HomeScreenView {
    
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
                .fill(.ultraThinMaterial)
                .offset(x: 30)
                .aspectRatio(0.6, contentMode: .fill)
        }
    }
}
