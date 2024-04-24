//
//  ContentView.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject var navigationCoordinator = NavigationCoordinator()
    @EnvironmentObject var themeManager: ThemeManager

    var body: some View {
        NavigationView {
            switch navigationCoordinator.currentPage {
            case .home:
                HomeScreenView(viewModel: DependencyContainer.shared.resolveViewModel(HomeScreenViewModel.self)!)
            case .none:
                EmptyView()
            }
        }.onChange(of: colorScheme, {
            switch colorScheme {
            case .dark:
                themeManager.updateTheme(to: .dark)
            default:
                themeManager.updateTheme(to: .light)
            }
        })
    }
}

#Preview {
    ContentView()
        .environmentObject(ThemeManager())
}
