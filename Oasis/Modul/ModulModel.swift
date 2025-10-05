//
//  ModulModel.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import Foundation
import UIKit

struct ModulModel: Decodable, Identifiable {
    let id: String
    let title: String
    let status: String
    let statusColorHex: String
    let iconColorHex: String
    let iconName: String
    let energyValue: Double
    let temperatureValue: String
    let processValue: Double
    let task: String
    let interaction: String
    let materials: [MoterialModel]
}

struct MoterialModel: Decodable {
    let title: String
    let value: Double
}
