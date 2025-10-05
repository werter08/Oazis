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
    var value: Double
    
    var body: some View {
        VStack {
            if value > 0 {
                HStack {
                    CustomText(title, type: .subTitle)
                    
                    Spacer()
                    
                    Text("\(Int(value*100))%")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.customGreen)
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
                .frame(height: 8)
                .mask {
                    RoundedRectangle(cornerRadius: 12)
                }
            }
        }
    }
}

#Preview {
    VStack {
        CustomProgressView(title: "Progress", value: 0.67)
        CustomProgressView(title: "Progress", value: 0.2)
    }
  
        .background(Color.border)
        .padding()
}
