//
//  AddDiaryAlert.swift
//  EmotionDiary
//
//  Created by dev on 2023/10/16.
//

import SwiftUI
import NaturalLanguage

struct AddDiaryAlert: View {
    
    @Binding var shouldAddNewDiary: Bool
    
    @State var title: String = ""
    @State var detail: String = ""
    
    var addDiaryButtonAction: ((Diary) -> Void)?
    
    private let emotionClassifier: NLModel? = {
        let model = try? NLModel(mlModel: EmotionClassifier().model)
        return model
    }()
    
    // MARK: - View
    var body: some View {
        ZStack {
            // 배경 흐리게 하기 위해
            Color.black.opacity(0.75)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                // 얼럿 상단
                HStack {
                    Text("새로운 일기 쓰기")
                        .font(.system(size: 20, weight: .bold))
                    
                    Spacer()
                    
                    Button {
                        withAnimation {
                            shouldAddNewDiary = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                .frame(width: 300)
                
                TextField("일기 제목", text: $title)
                    .frame(width: 300)
                    .padding(.all, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5))
                    }
                
                TextField("일기 내용", text: $detail, axis: .vertical)
                    .lineLimit(8...12)
                    .frame(width: 300)
                    .padding(.all, 8)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray.opacity(0.5))
                    }
                
                // 일기 추가 버튼
                Button {
                    // TODO: - AI가 newDiary에 쓰여진 detail을 분석 결과를 활용하여 emotion을 변경 해야함
                    let emotion = emotionClassifier?.predictedLabel(for: detail)
            
                    let emotionResult: Emotion = emotion == "positive" ? .happy : .bad
                    print("emotion result: \(emotionResult)")
                    let newDiary = Diary(title: title,
                                         detail: detail,
                                         emotion: emotionResult)
                    addDiaryButtonAction!(newDiary)
                } label: {
                    Text("일기 추가")
                        .frame(width: 90, height: 38)
                        .foregroundColor(.white)
                        .background(!title.isEmpty && !detail.isEmpty ? Color.blue : Color.gray.opacity(0.2)) // 제목과 내용이 비어있는 여부에 따라 일기 추가 버튼 상태 색 설정
                        .cornerRadius(10)
                }
                .disabled(title.isEmpty) // 제목이 비어있으면 일기 추가 버튼 disabled
                .padding(.top)
            }
            .padding()
            .background()
        .cornerRadius(10)
        }
    }
}

struct AddDiaryAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddDiaryAlert(shouldAddNewDiary: Binding<Bool>.constant(false))
    }
}
