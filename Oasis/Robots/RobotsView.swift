//
//  RobotsView.swift
//  Oasis
//
//  Created by Begench on 05.10.2025.
//

import SwiftUI

struct RobotsView: View {
    
    @StateObject var viewModel = RobotsViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                RobotsOrbit()
            }
        }.environmentObject(viewModel)
    }
}

#Preview {
    RobotsView()
}
