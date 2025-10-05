//
//  CustomText.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var icon: String?
    var color: Color
    var fullEcran: Bool
    var action: () -> ()
    
    init(_ title: String, icon: String? = nil, color: Color, fullEcran: Bool = false, action: @escaping () -> Void) {
        self.title = title
        self.icon = icon
        self.color = color
        self.action = action
        self.fullEcran = fullEcran
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            HStack {
                if let icon {
                    Image(icon)
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 24, height: 24)
                        .scaledToFit()
                        .foregroundStyle(color)
                }
                Text(title)
                    .foregroundStyle(color)
                    .font( fullEcran ? .customTitleFont : .buttonTitle)
                    .frame(maxWidth: fullEcran ? .infinity : nil, alignment: .center)
            }
        }
        .padding()
        .cornerRadius(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(style: .init(lineWidth: 1))
                .fill(.customDatkGray)
        }
    
    }
}
