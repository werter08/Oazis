//
//  ModulsViewModel.swift
//  Oasis
//
//  Created by Begench on 05.10.2025.
//

import Foundation

class RobotsViewModel: ObservableObject {
    @Published var moduls: [RobotModel] = []
    var dataManger = DataManager()
    
    private let maxTolerableTemp: Double = 35.0 // Max temp before system is 'bad'
    private let optimalTempMin: Double = 18.0
    private let optimalTempMax: Double = 25.0
    
    private let minTolerablePower: Double = 0.50 // Minimum acceptable power/efficiency
    private let optimalPowerMin: Double = 0.70 // Optimal efficiency (e.g., 70% or 0.70)

    
    
    init() {
        getData()
    }
    
    func getData() {
        dataManger.getRobots { result in
            if let error = result.complitionError {
                print(error)
            } else {
                self.moduls = result.content
            }
        }
    }


}
