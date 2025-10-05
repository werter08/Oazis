//
//  OasisApp.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

@main
struct OasisApp: App {
    @State var logedIn = false
    var body: some Scene {
        WindowGroup {
            if logedIn {
                ContentView()
            } else {
                LoginView(isLoegIn: $logedIn)
            }
        }
    }
}
