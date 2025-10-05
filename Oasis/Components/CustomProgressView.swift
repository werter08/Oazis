//
//  CustomProgressView.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

struct CustomProgressView: View {
    var title: String
    var iconName: String?
    var color: Color?
    var value: Double
    var height: CGFloat?
    
    var body: some View {
        VStack {
            if value > 0 {
                HStack {
                    if let iconName {
                        Image(iconName)
                            .renderingMode(.template)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(color ?? .customGreen)
                    }
                    
                    CustomText(title, type: .subTitle)
                    
                    Spacer()
                    
                    Text("\(Int(value*100))%")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(color ?? .customGreen)
                }
                
                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Color.customDatkGray
                            .frame(width: geometry.size.width)
                            .cornerRadius(12)
                        
                        Color.customBllue
                            .frame(width: geometry.size.width * max(0, min(1, value)))
                            .cornerRadius(12)
                    }
                }
                .frame(height: height ?? 8)
                .mask {
                    RoundedRectangle(cornerRadius: 12)
                }
            }
        }
    }
}
