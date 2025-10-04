//
//  OasisApp.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

@main
struct OasisApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
