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
    case largeLargeTitle
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
        case .largeLargeTitle:
                .largeLargeTitle
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
                .customWhite
        case .largeTitle:
                .customWhite
        case .largeLargeTitle:
                .white
        case .title:
                .customWhite
        case .largeSubtitle:
                .customBrightGray
        case .subTitle:
                .customBrightGray
        }
    }
}
