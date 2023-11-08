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
    
    static func getEmojiIcon(_ emotion: Emotion) -> Image {
        switch emotion {
        case .veryHappy:
            return Image("veryHappy")
        case .happy:
            return Image("happy")
        case .soso:
            return Image("soso")
        case .bad:
            return Image("bad")
        case .veryBad:
            return Image("veryBad")
        }
    }
}
