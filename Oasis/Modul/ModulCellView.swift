//
//  MOdulCellView.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI

struct ModulCellView: View {
    var model: ModulModel

    var body: some View {
        VStack {
            HStack {
                Image(systemName: model.iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .foregroundStyle(Color(hex: model.iconColorHex))
                Spacer()
            }
            
            VStack(spacing: 12) {
                CustomText(model.title, type: .title)
                    .frame(maxWidth: .infinity, alignment: .leading)

                CustomText(model.status, type: .subTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
           
            }.frame(height: 80)
            .padding(.vertical)
            
            VStack {
                HStack {
                    HStack(spacing: 0) {
                        Image(systemName: "thermometer.medium")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.customOrange)
                        CustomText(model.temperatureValue, type: .subTitle)
                    }
                    Spacer(minLength: 5)
                    HStack(spacing: 0) {
                        Image(systemName: "bolt")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.customBllue)
                        CustomText(model.temperatureValue, type: .subTitle)
                    }
                }
            }.frame(height: 60, alignment: .top)
        }
        
        .frame(height: UIScreen.main.bounds.height/3.5)
        .padding()
        .padding(.horizontal, 5)
        .background(.customBlack)
        .cornerRadius(12)
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(style: .init(lineWidth: 1))
                .fill(.customDatkGray)
        }
        .overlay(alignment: .topTrailing) {
            Circle()
                .frame(width: 12, height: 12)
                .foregroundStyle(Color(hex: model.statusColorHex))
                .padding()
        }
        .overlay(alignment: .bottom) {
            CustomProgressView(title: "Progress", value: model.processValue)
                .padding()
                .padding(.horizontal, 5)
        }
       
  
    }
}


#Preview {
    HStack {
        ModulCellView(model: ModulModel(id: "M-001", title: "Modul", status: "Alive", statusColorHex: "#FFFFFF", iconColorHex: "#FFFFFF", iconName: "cube", energyValue: 0.48, temperatureValue: "38C", processValue: 0.28, task: "", interaction: "", materials: []))
        ModulCellView(model: ModulModel(id: "M-001", title: "Modul", status: "Alive", statusColorHex: "#FFFFFF", iconColorHex: "#FFFFFF", iconName: "cube", energyValue: 0.48, temperatureValue: "38C", processValue: 0, task: "", interaction: "", materials: []))
        
    }.padding()
        .background(Color.customBlack)
}
