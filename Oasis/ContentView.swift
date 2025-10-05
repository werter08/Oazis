//
//  ContentView.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
            ZStack(alignment: .bottom) {
                
                VStack(spacing: 0) {
                    
                    CustomHeaderView()
                        .padding(.top, 50)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(Color.customDatkGray)
                                .frame(height: 1)
                                .frame(maxWidth: .infinity)
                            
                        }
                    
                    TabView(selection: $selectedTab) {
                        
                        ModulsView()
                            .tabItem {
                                // FIX: Use Image and Text directly for manual control
                                Image("browse")
                                    // CRUCIAL: Force the icon to be treated as a mask that accepts color
                                    .renderingMode(.template)

                                Text("Dashboard")
                            }
                            .tag(0)
                            
                        RobotsView()
                            .tabItem {
                                // FIX: Use Image and Text directly for manual control
                                Image("robot")
                                    // CRUCIAL: Force the icon to be treated as a mask that accepts color
                                    .renderingMode(.template)
                                Text("Robots")
                            }
                            .tag(1)
                    }
                    // ... rest of your modifiers
                    // Apply all customization modifiers directly to the TabView
                    .toolbarBackground(Color.customBlack, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    .toolbarColorScheme(.dark, for: .tabBar)
                    // 👇 This sets the selected item color
                    .tint(.accent)
                    .overlay(alignment: .bottom) {
                        // This overlay places the border at the TOP of the custom-colored tab bar
                        Rectangle()
                            .fill(Color.customDatkGray)
                            .frame(height: 2)
                            // Adjust the offset to position it correctly on top of the tab bar
                            .offset(y: -49) // ~49 pts is the height of the tab bar
                    }
                }
                .ignoresSafeArea(.all, edges: .top)
                
            
        }
    }
}

struct CustomHeaderView: View {
    var body: some View {
        HStack {
            Image(.logo)
            VStack {
                Text("System Dashboard")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Command Center")
                    .font(.largeSubTitle)
                    .foregroundStyle(.customBrightGray)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
//            Image(systemName: "bell.badge")
//                .font(.title2)
//                .foregroundStyle(.blue)
        }
        
        .padding()
        .frame(height: 80)
        .background(Color.customBlack)
        
    }
}

struct HomeView: View {
    var body: some View {
        Text("Welcome Home! (Tab 1)")
            .font(.title2)
    }
}

struct SettingsView: View {
    var body: some View {
        Text("App Settings (Tab 2)")
            .font(.title2)
    }
}

struct ProfileView: View {
    var body: some View {
        Text("User Profile (Tab 3)")
            .font(.title2)
    }
}

#Preview {
    ContentView()
}
