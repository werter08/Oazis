//
//  ExtensionFonts.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import SwiftUI
import Foundation

extension Color {
    /// Initializes a SwiftUI Color from a Hex String (e.g., "#FF0000" or "00FF00FF")
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        // Attempt to convert the hex string to a 64-bit unsigned integer
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red, green, blue, alpha: Double
        
        // Determine if the hex string includes an alpha component (8 characters) or not (6 characters)
        switch hexSanitized.count {
        case 6:
            // RRGGBB format
            red = Double((rgb >> 16) & 0xFF) / 255.0
            green = Double((rgb >> 8) & 0xFF) / 255.0
            blue = Double(rgb & 0xFF) / 255.0
            alpha = 1.0 // Full opacity
        case 8:
            // RRGGBBAA format
            red = Double((rgb >> 24) & 0xFF) / 255.0
            green = Double((rgb >> 16) & 0xFF) / 255.0
            blue = Double((rgb >> 8) & 0xFF) / 255.0
            alpha = Double(rgb & 0xFF) / 255.0 // Use the alpha component
        default:
            // Invalid format, default to clear or black
            red = 0
            green = 0
            blue = 0
            alpha = 0 // Clear color
        }
        
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: alpha)
    }
}

