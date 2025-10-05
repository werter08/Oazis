//
//  ModulsViewModel.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import Foundation
import SwiftUI

class ModulsViewModel: ObservableObject {
    @Published var moduls: [ModulModel] = []
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
        dataManger.getModuls { result in
            if let error = result.complitionError {
                print(error)
            } else {
                self.moduls = result.content
            }
        }
    }
    
    func getAvarageTemp() -> String {
        
        // 1. Extract valid temperatures as Doubles
        let temperatures = moduls.compactMap { modul -> Double? in
            
            // Remove the unit suffix ("C", "°C") and any whitespace
            let cleanedString = modul.temperatureValue
                .uppercased()
                .replacingOccurrences(of: "°C", with: "")
                .replacingOccurrences(of: "C", with: "")
                .trimmingCharacters(in: .whitespaces)
            
            // Attempt to convert the remaining string to a Double
            return Double(cleanedString)
        }
        
        // Handle the case where the array is empty to avoid division by zero
        guard !temperatures.isEmpty else {
            return "N/A"
        }
        
        // 2. Calculate the average
        let totalSum = temperatures.reduce(0, +)
        let average = totalSum / Double(temperatures.count)
        
        // 3. Format the result string (e.g., "15.4 °C")
        let formattedAverage = String(format: "%.1f", average)
        
        return "\(formattedAverage) °C"
    }
    
    func getAvaragePower() -> Double {
         
         // 1. Filter out modules where the energyValue might be zero or negative (if applicable)
         let validPoverValues = moduls
             .map { $0.energyValue }
             
         // 2. Handle the case where the array is empty
         guard !validPoverValues.isEmpty else {
             return 0.0
         }
         
         // 3. Calculate the average using reduce
         let totalSum = validPoverValues.reduce(0.0, +)
         let average = totalSum / Double(validPoverValues.count)
         
         return average
     }
    
    func getSystemStatus() -> SystemStatusType {
        let averageTemp: Double = {
            var s = self.getAvarageTemp()
                .uppercased()
                .replacingOccurrences(of: "°C", with: "")
                .replacingOccurrences(of: "C", with: "")
                .trimmingCharacters(in: .whitespaces)
            
            return Double(s) ?? 0
        }()
            
        
        
        let averagePower = getAvaragePower()
        // 1. Check for 'BAD' Status (Critical failures)
        // System is 'bad' if it's too hot OR efficiency/power is too low.
        if averageTemp > maxTolerableTemp || averagePower < minTolerablePower {
            return .bad
        }
        
        // 2. Check for 'SUPER' Status (Optimal performance)
        // System is 'super' if BOTH temp and power are within the optimal range.
        if averageTemp >= optimalTempMin && averageTemp <= optimalTempMax &&
           averagePower >= optimalPowerMin {
            
            return .super
        }
        
        // 3. Otherwise, it's 'NORMAL'
        // If it passed the 'bad' check but failed the 'super' check, it's working
        // but not optimally (e.g., slightly warm, or slightly inefficient).
        return .normal
    }
}
