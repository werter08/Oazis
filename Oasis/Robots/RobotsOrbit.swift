//
//  RobotsOrbit.swift
//  Oasis
//
//  Created by Begench on 05.10.2025.
//

import SwiftUI

struct RobotsOrbit: View {
    
    @EnvironmentObject var robotsOrbit: RobotsViewModel
    var gridSize: CGSize
    
    var body: some View {
        VStack {
            CustomText("Orbital Map", type: .largeTitle, color: .customBrightGray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ZStack {
                Image(.grid)
                    .resizable()
                    .frame(width: gridSize.width, height: gridSize.height)
                    .scaledToFit()
                
                // ForEach works because your ModulModel is likely identifiable (by 'id')
                ForEach(robotsOrbit.moduls) { robot in
                    if robot.isActive {
                        CustomAnimatedBorderCircle(color: Color(hex: robot.color), size: 24)
                        // Pass the String ID to the offset functions
                            .offset(x: randomXOffset(for: robot.id, in: gridSize.width),
                                    y: randomYOffset(for: robot.id, in: gridSize.height))
                    } else {
                        Circle()
                            .fill(Color(hex: robot.color))
                            .frame(width: 18, height: 18)
                            .offset(x: randomXOffset(for: robot.id, in: gridSize.width),
                                    y: randomYOffset(for: robot.id, in: gridSize.height))
                    }
                }
            }
            .padding()
            .padding(.horizontal, 5)
        }.background(.customBlack)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style: .init(lineWidth: 1))
                    .fill(.customDatkGray)
            }
    }
    
    // MARK: - Position Calculation Helpers
    
    // Function uses the String ID to get a stable hash value (the seed)
    private func randomXOffset(for id: String, in width: CGFloat) -> CGFloat {
        let seed = id.hashValue // Use the stable hash of the String ID
        
        // Random number between 0.0 and 1.0 (based on seed)
        // We ensure the result is positive by using abs()
        let randomFactor = Double(abs(seed) % 1000) / 1000.0
        
        // Offset range is from -width/2 to +width/2
        return CGFloat(randomFactor) * width - (width / 2)
    }

    private func randomYOffset(for id: String, in height: CGFloat) -> CGFloat {
        // Use the ID hash with a modifier to ensure X and Y are distinct
        let seed = id.hashValue + 123
        
        // Random number between 0.0 and 1.0 (based on seed)
        let randomFactor = Double(abs(seed) % 1000) / 1000.0
        
        // Offset range is from -height/2 to +height/2
        return CGFloat(randomFactor) * height - (height / 2)
    }
}

