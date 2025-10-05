//
//  ModulState.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import Foundation
import SwiftUI

enum ModulState: Decodable {
    case active
    case processing
    case standBy
}

enum SystemStatusType {
    case `super`
    case normal
    case bad
    
    var title: String {
        switch self {
        case .super:
            "All Systems Nominal"
        case .normal:
            "With Some Issue"
        case .bad:
            "Must Repair"
        }
    }
    
    var color: Color {
        switch self {
        case .super:
            Color.customGreen
        case .normal:
            Color.customBllue
        case .bad:
            Color.customRed
        }
    }
    
    var animationDuration: Double {
        switch self {
        case .super:
            5
        case .normal:
            3
        case .bad:
            1
        }
    }
}
