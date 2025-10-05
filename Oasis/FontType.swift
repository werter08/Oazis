//
//  FontType.swift
//  Oasis
//
//  Created by Begench on 04.10.2025.
//

import Foundation
import SwiftUI


enum FontType {
    case buttonTitle
    case largeTitle
    case title
    case largeSubtitle
    case subTitle
    
    
    var font: Font {
        switch self {
        case .buttonTitle:
                .buttonTitle
        case .largeTitle:
                .largeTitle
        case .largeSubtitle:
                .largeSubTitle
        case .title:
                .customTitleFont
        case .subTitle:
                .customSubTitleFont
        }
    }
    
    var Color: Color {
        switch self {
        case .buttonTitle:
                .white
        case .largeTitle:
                .white
        case .title:
                .white
        case .largeSubtitle:
                .customBrightGray
        case .subTitle:
                .customBrightGray
        }
    }
}
