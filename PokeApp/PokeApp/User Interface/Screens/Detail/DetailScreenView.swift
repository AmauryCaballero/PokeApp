//
//  DetailScreenView.swift
//  PokeApp
//
//  Created by Amaury Caballero on 24/4/24.
//

import SwiftUI
struct DetailScreenView: View {
    @ObservedObject var viewModel: DetailScreenViewModel
    @EnvironmentObject var themeManager: ThemeManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var selectedTab = "About"
    let tabs = ["About", "Stats", "Moves", "Evolutions"]
    
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
                            
                            HStack {
                                ForEach(tabs, id: \.self) { tab in
                                    Button(action: {
                                        self.selectedTab = tab
                                    }) {
                                        Text(tab)
                                            .pokeFont(.button)
                                            .foregroundColor(self.selectedTab == tab ? themeManager.currentTheme.text : .gray)
                                            .frame(maxWidth: .infinity)
                                            .background (
                                                Capsule()
                                                    .frame(height: 4)
                                                    .padding(.horizontal, 10)
                                                    .foregroundColor(self.selectedTab == tab ? themeManager.currentTheme.text : .clear)
                                                    .offset(y: 12),
                                                alignment: .bottomLeading
                                                
                                            )
                                    }
                                }
                            }
                            
                            TabView(selection: $selectedTab) {
                                aboutTab(pokemonInfo)
                                    .tag(tabs[0])
                                
                                statTab(pokemonInfo, color: viewModel.pokemonColor ?? themeManager.currentTheme.accent)
                                    .tag(tabs[1])
                                
                                tab(tabs[2])
                                    .tag(tabs[2])
                                
                                tab(tabs[3])
                                    .tag(tabs[3])
                                
                                
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: UIScreen.main.bounds.width)
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .animation(.default, value: selectedTab)
                            
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
                        .foregroundColor(viewModel.pokemonColor ?? themeManager.currentTheme.accent)
                        
                }
            )
        }
        
    }
}
