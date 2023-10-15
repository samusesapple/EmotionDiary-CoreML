//
//  DiaryView.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import SwiftUI

enum Emotion: Int {
    case veryHappy = 2
    case happy = 1
    case soso = 0
    case bad = -1
    case veryBad = -2
}

struct DiaryView: View {
    let title: String
    let detail: String
    let emotion: Emotion
    
    private var emotionColor: Color {
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
    
    // MARK: - View
    var body: some View {
        VStack(alignment: .leading) {
            HStack { // 제목, 감정동그라미
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                
                Spacer()
                
                Circle() // 긍정, 부정 수치에 따라 변할 색
                    .frame(width: 18, height: 18)
                    .foregroundColor(emotionColor)
            }
            
            Text(detail)
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
        DiaryView(title: "일기 제목",
                  detail: "일기에 들어간 내용",
                  emotion: .soso)
    }
}
