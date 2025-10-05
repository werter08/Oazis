//
//  RobotCellView.swift
//  Oasis
//
//  Created by Begench on 05.10.2025.
//

import SwiftUI

struct RobotCellView: View {
    var model: RobotModel
    @Binding var selectedRobotId: String?
    
    var body: some View {
        
        if selectedRobotId == model.id {
            VStack {
                HStack {
                    HStack {
                        Image(.robot)
                            .resizable()
                            .renderingMode(.template)
                            .foregroundStyle(.customBllue)
                            .frame(width: 32, height: 32)
                        
                        VStack {
                            CustomText(model.name, type: .largeSubtitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            CustomText(model.id, type: .subTitle)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                   
                    Spacer()
                    
                    CustomButton(model.isActive ? "Active" : "Maintencance", color: model.isActive ? .customGreen : .customRed, action: {})
                }.padding(.bottom, 60)
                
                VStack(spacing: 30) {
                    CustomProgressView(title: "Battery", iconName: "batarry", color: model.battery > 0.8 ? .customGreen : model.battery > 0.4 ? .customOrange : .customRed, value: model.battery)
                    CustomProgressView(title: "Health", iconName: "favorite", color: model.health > 0.8 ? .customGreen : model.health > 0.4 ? .customOrange : .customRed, value: model.health)
                    HStack {
                        Image(.locaTION)
                        
                        CustomText("Current Tack: ", type: .subTitle)
                        
                        CustomText(model.task, type: .title)
                        
                        Spacer(minLength: 0)
                    }
                }
                

            }
            .padding()
            .background(.customBlack)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style: .init(lineWidth: 1))
                    .fill(.customDatkGray)
            }
            
        } else {
            HStack {
                Image(.robotMainIcon)
                
                VStack {
                    CustomText(selectedRobotId == model.id ? model.name : model.name, type: .title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomText(model.task, type: .subTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                Spacer()
                
                VStack {
                    HStack {
                        Image(.batarry)
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                        
                            .scaledToFit()
                            .foregroundStyle(model.battery > 0.8 ? .customGreen : model.battery > 0.4 ? .customOrange : .customRed)
                        
                        CustomText("\(Int(model.battery*100))%", type: .subTitle)
                    }
                    HStack {
                        Image(.favorite)
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 24, height: 24)
                            .scaledToFit()
                            .foregroundStyle(model.health > 0.8 ? .customGreen : model.health > 0.4 ? .customOrange : .customRed)
                        
                        CustomText("\(Int(model.health*100))%", type: .subTitle)
                    }
                }
            }
            .padding()
            .background(.customBlack)
            .cornerRadius(12)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(style: .init(lineWidth: 1))
                    .fill(.customDatkGray)
            }
            
        }
    }
}

#Preview {
    VStack {
        RobotCellView(model: RobotModel(id: "sdd", name: "name", task: "task", color: "#FFFFFF", battery: 0.34, health: 0.17, isActive: true), selectedRobotId: .constant("001"))
    }.padding()
}
