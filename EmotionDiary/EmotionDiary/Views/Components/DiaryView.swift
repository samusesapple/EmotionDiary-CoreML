//
//  DiaryView.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import SwiftUI

struct DiaryView: View {
    let diary: Diary
    
    private var emotionColor: Color {
        switch diary.emotion {
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
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            HStack { // 제목, 감정동그라미
                Text(diary.title)
                    .font(.system(size: 18, weight: .semibold))
                
                Spacer()
                
                Circle() // 긍정, 부정 수치에 따라 변할 색
                    .frame(width: 18, height: 18)
                    .foregroundColor(emotionColor)
            }
            
            Text(diary.detail)
                .font(.system(size: 14))
        }
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 1)
                .foregroundColor(.black.opacity(0.8))
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(diary: Diary.mockDiarys[0])
    }
}
