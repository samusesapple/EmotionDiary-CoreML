//
//  EmotionChartView.swift
//  EmotionDiary
//
//  Created by 성현관 on 11/13/23.
//

import SwiftUI
import Charts

struct EmotionChartView: View {
    @Binding var diaryList: [Diary]
    
    private func getCertainEmotionDiaryList(get emotion: Emotion) -> [Diary] {
        return diaryList.filter {
            $0.emotion == emotion
        }
    }
    
    var body: some View {
        Chart(diaryList, id: \.self) { diary in
            BarMark(
                x: .value("Emotion", diary.emotion),
                y: .value("Count", diaryList.count),
                width: 20
            )
        }
        .padding()
    }
}

#Preview {
    EmotionChartView(diaryList: .constant(Diary.mockDiaries))
}
