//
//  EmotionClassifierService.swift
//  EmotionDiary
//
//  Created by 성현관 on 11/15/23.
//

import SwiftUI

struct EmotionClassifierService {
    
    private init() { }
    
    static func getEmotionWithData(_ data: [String: Double]) -> Emotion {
        let positiveRate = data.filter { key, _ in
            key == "positive"
        }.map { _, value in
            return value
        }[0]
        
        let negativeRate = data.filter { key, _ in
            key == "negative"
        }.map { _, value in
            return value
        }[0]
        
        print("POSITIVE: \(positiveRate), NEGATIVE: \(negativeRate)")
        return getEmotionWithPositiveAndNegativeData(positiveRate: positiveRate, negativeRate: negativeRate)
    }
    
    private static func getEmotionWithPositiveAndNegativeData(positiveRate: Double, negativeRate: Double) -> Emotion {
        switch positiveRate {
        case 0.8...1.0:
            return .veryGood
        case 0.6..<0.8:
            return .good
        case 0.4..<0.6:
            return .soso
        case 0.2..<0.4:
            return .bad
        default:
            return .veryBad
        }
    }
    
    static func switchEmotionIntoEmojiIcon(_ emotion: Emotion) -> Image {
        switch emotion {
        case .veryGood:
            return Image("veryHappy")
        case .good:
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
