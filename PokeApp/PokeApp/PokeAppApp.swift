//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Amaury Caballero on 19/4/24.
//

import SwiftUI

@main
struct PokeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
