//
//  ContentView.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @StateObject var navigationCoordinator = NavigationCoordinator()
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        NavigationView {
            switch navigationCoordinator.currentPage {
            case .home:
                HomeScreenView()
            case .none:
                EmptyView()
            }
        }
    }

}


#Preview {
    ContentView()
        .environmentObject(ThemeManager())
        .environment(\.colorScheme, .dark)
}
