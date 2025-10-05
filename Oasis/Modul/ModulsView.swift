//
//  ModulsView.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

struct ModulsView: View {
    
    @StateObject var viewModel = ModulsViewModel()
    var gridLayout = Array(repeating: GridItem(.flexible()), count: Int(2))

   
    var body: some View {
        ScrollView(showsIndicators: false) {
            CustomText("Station Monitoring", type: .largeTitle, color: .customBllue)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
            CustomText("All systems operational", type: .largeSubtitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom)
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 12) {
                if !viewModel.moduls.isEmpty {
                    ForEach(viewModel.moduls) { elements in
                        ModulCellView(model: elements)
                    }
                } else {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .tint(.white)
                }
            }
            
            StationCelView()
            
            StationStatusCellView(state: viewModel.getSystemStatus())
                .padding(.bottom)
            
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            .padding(.horizontal)
            .background(Color.customBlack)
            .environmentObject(viewModel)
    }
}

#Preview {
    ModulsView()
}
