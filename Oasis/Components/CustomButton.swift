//
//  CustomText.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> ()
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Text(title)
                .foregroundStyle(Color.white)
                .font(.buttonTitle)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.border)
        .cornerRadius(12)
    
    }
}

#Preview {
    CustomButton("Submit") {}
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg)
}
