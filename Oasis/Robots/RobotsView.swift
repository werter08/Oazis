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
                RobotsOrbit(gridSize: CGSize(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50))
            }
        }.environmentObject(viewModel)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .padding(.horizontal)
            .background(Color.customBlack)
            
    }
}

#Preview {
    RobotsView()
}
