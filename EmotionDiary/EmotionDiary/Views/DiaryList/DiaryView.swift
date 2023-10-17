//
//  DiaryView.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import SwiftUI

struct DiaryView: View {
    let diary: Diary

    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            // 제목, 감정동그라미
            HStack {
                Text(diary.title)
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                Circle() // 긍정, 부정 수치에 따라 변할 색
                    .frame(width: 18, height: 18)
                    .foregroundColor(Emotion.getColor(diary.emotion))
            }
            
            // 다이어리 내용
            Text(diary.detail)
                .font(.system(size: 14))
        }
        .padding()
        .background(.gray.opacity(0.1))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(diary: Diary.mockDiaries[0])
    }
}
