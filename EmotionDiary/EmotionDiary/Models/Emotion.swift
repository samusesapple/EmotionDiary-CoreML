//
//  Emotion.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import SwiftUI
import Charts

enum Emotion: String, CaseIterable, Plottable {
    case veryGood = "Very Good"
    case good = "Good"
    case soso = "Normal"
    case bad = "Bad"
    case veryBad = "Very Bad"
    
    var order: Int {
        switch self {
        case .veryGood:
            return 2
        case .good:
            return 1
        case .soso:
            return 0
        case .bad:
            return -1
        case .veryBad:
            return -2
        }
    }
}
