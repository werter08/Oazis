//
//  StationStatusCellView.swift
//  Oasis
//
//  Created by Begench on 05.10.2025.
//

import SwiftUI

struct StationStatusCellView: View {

    var state: SystemStatusType
    
    var body: some View {
        HStack {
            VStack(spacing: 2) {
                CustomText("Station Overview", type: .subTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                CustomText(state.title, type: .largeTitle, color: state.color)
                    .frame(maxWidth: .infinity, alignment: .leading)

            }.frame(maxWidth: UIScreen.main.bounds.width/1.7)
            
            Spacer()
            
            CustomAnimatedCircle(color: state.color, size: 24, animationDuration: state.animationDuration)
            
        }.padding()
            .padding(5)
            .background(.customBlack)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style: .init(lineWidth: 1))
                    .fill(.customDatkGray)
            }
    }
}

#Preview {
    VStack {
        StationStatusCellView(state: .super)
        StationStatusCellView(state: .normal)
        StationStatusCellView(state: .bad)
    }.padding()
}
