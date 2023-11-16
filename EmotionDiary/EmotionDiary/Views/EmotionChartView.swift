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
    
    private func getCertainEmotionDiaryCount(with emotion: Emotion) -> Int {
        return diaryList.filter { $0.emotion == emotion }.count
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
        
        Chart(Emotion.allCases, id: \.self) { emotion in
            BarMark(
                x: .value("Emotion", emotion),
                y: .value("Count", getCertainEmotionDiaryCount(with: emotion)),
                width: 30
            )
            .foregroundStyle(by: .value("Emotion", emotion))
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
