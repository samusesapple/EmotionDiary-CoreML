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
    
    var sortedDiaryList: [Diary] {
        return diaryList.sorted {
            $0.emotion.localizationInt > $1.emotion.localizationInt
        }
    }
    
    var body: some View {
        if diaryList.isEmpty {
            VStack {
                Spacer()
                
                Text("통계를 보여줄 일기가 없습니다.\n\n일기를 먼저 작성해주세요.")
                    .font(.title3)
                    .bold()
                    .multilineTextAlignment(.center)
                
                Spacer()
            }
        }
        
        Chart(sortedDiaryList, id: \.self) { diary in
            BarMark(
                x: .value("Emotion", diary.emotion),
                y: .value("Count", 1),
                width: 30
            )
            .foregroundStyle(by: .value("Emotion", diary.emotion))
        }
        .chartForegroundStyleScale([
            "Very Good": .red,
            "Good": .orange,
            "Normal": .green,
            "Bad": .blue,
            "Very Bad": .purple
        ])
        .padding()
    }
}

#Preview {
    EmotionChartView(diaryList: .constant(Diary.mockDiaries))
}
