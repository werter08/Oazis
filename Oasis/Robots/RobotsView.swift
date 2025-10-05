//
//  RobotsView.swift
//  Oasis
//
//  Created by Begench on 05.10.2025.
//

import SwiftUI

struct RobotsView: View {
    
    @StateObject var viewModel = RobotsViewModel()
    @State var selectedRobotId: String?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                CustomText("Robot Fleet", type: .largeTitle, color: .customBllue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 5)
                CustomText("\(viewModel.getActive()) active units", type: .largeSubtitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                RobotsOrbit(gridSize: CGSize(width: UIScreen.main.bounds.width - 80, height: UIScreen.main.bounds.width - 80))
                
                LazyVStack(alignment: .center, spacing: 12) {
                    if !viewModel.models.isEmpty {
                        ForEach(viewModel.models) { elements in
                            
                            RobotCellView(model: elements, selectedRobotId: $selectedRobotId)
                                .clipped()
                                .onTapGesture {
                                    withAnimation {
                                        if selectedRobotId == elements.id {
                                            selectedRobotId = nil
                                        } else {
                                            selectedRobotId = elements.id
                                        }
                                    }
                                }
                        }
                    } else {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                            .tint(.white)
                    }
                }
                
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
