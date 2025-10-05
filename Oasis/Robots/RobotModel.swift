//
//  RobotModel.swift
//  Oasis
//
//  Created by Begench on 05.10.2025.
//

import Foundation

struct RobotModel: Decodable, Identifiable {
    let id: String
    let name: String
    let task: String
    let color: String
    let battery: Double
    let health: Double
    let isActive: Bool
}
