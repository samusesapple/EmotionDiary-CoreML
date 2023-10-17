//
//  Diary.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import Foundation

struct Diary: Hashable {
    let title: String
    let detail: String
    var emotion: Emotion
    
    /// mock Diary lists를 가져오기 위한 계산속성
    static var mockDiaries: [Diary] {
        var mockDiaries: [Diary] = []
        
        for num in 0...9 {
            let newDiary = Diary(title: "Sample Diary \(num+1)",
                                 detail: """
                                 Detail of sample Diary \(num+1)
                                 \(num+1)번째 샘플 다이어리 내용
                                 """,
                                 emotion: Emotion.allCases.randomElement()!)
            mockDiaries.append(newDiary)
        }
        return mockDiaries
    }
}


