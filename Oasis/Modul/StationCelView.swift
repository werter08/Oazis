//
//  StationCelView.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import Foundation
import SwiftUI

struct StationCelView: View {
    @EnvironmentObject var viewModel: ModulsViewModel
    
    var body: some View {
        VStack {
            VStack(spacing: 12) {
                CustomText("Station Overview", type: .largeTitle, color: .customBllue)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom)
                
                HStack {
                    VStack(spacing: 12) {
                        CustomText("Modules", type: .subTitle)
                        
                        CustomText("\(viewModel.moduls.count)/\(viewModel.moduls.count)", type: .largeTitle, color: .customBllue)
                    }
                    Spacer()
                    VStack(spacing: 12) {
                        CustomText("Avg temperature", type: .subTitle)
                        
                        CustomText(viewModel.getAvarageTemp(), type: .largeTitle, color: .customGreen)
                    }
                    Spacer()
                    VStack(spacing: 12) {
                        CustomText("Power", type: .subTitle)
                        
                        CustomText("\(Int(viewModel.getAvaragePower() * 100))%", type: .largeTitle, color: .customOrange)
                    }
                }
            }
        }.padding()
            .padding(.horizontal, 5)
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
    StationCelView()
}
