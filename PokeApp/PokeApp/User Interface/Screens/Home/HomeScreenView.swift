//
//  HomeScreenView.swift
//  PokeApp
//
//  Created by Amaury Caballero on 22/4/24.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var themeManager: ThemeManager
    
    var body: some View {
        ZStack {
            background
            
            VStack {
                header
                
                searchBar
                
                Spacer()
            }
            .padding(50)
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            HomeScreenView()
                .previewDisplayName("Light Mode")
            
            
            HomeScreenView()
                .environment(\.colorScheme, .dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
