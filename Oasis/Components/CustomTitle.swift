//
//  CustomText.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

struct CustomText: View {
    
    var title: String
    
    var type: FontType
    var color: Color?
   
    init(_ title: String, type: FontType, color: Color? = nil) {
        self.title = title
        self.type = type
        self.color = color
    }
    
    var body: some View {
        Text(title)
            .font(type.font)
            .lineLimit(2)
            .foregroundStyle(color ?? type.Color)
    }
}

#Preview {
    VStack {
        CustomText("You make it like a booooss", type: .buttonTitle)
        CustomText("You make it like a booooss with title", type: .title)
        CustomText("You make it like a booooss with subTitle", type: .subTitle)
        
    }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg)
    
}


