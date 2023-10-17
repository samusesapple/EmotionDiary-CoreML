//
//  Emotion.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import SwiftUI

enum Emotion: Int, CaseIterable {
    case veryHappy = 2
    case happy = 1
    case soso = 0
    case bad = -1
    case veryBad = -2
    
    static func getColor(_ emotion: Emotion) -> Color {
        switch emotion {
        case .veryHappy:
            return Color.pink
        case .happy:
            return Color.purple
        case .soso:
            return Color.green
        case .bad:
            return Color.gray
        case .veryBad:
            return Color.black
        }
    }
}
