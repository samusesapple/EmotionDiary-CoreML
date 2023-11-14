//
//  ContentView.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import SwiftUI

struct MainView: View {
    
    @State var diaryList: [Diary] = []
    @State var shouldAddNewDiary: Bool = false // 새로운 일기 추가 얼럿 띄우기 여부
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    DiaryListView(diaryList: diaryList)
                        .padding(.top)
                    Text("일기 \(diaryList.count)개")
                        .font(.system(size: 14))
                        .foregroundColor(Color.gray.opacity(0.9))
                }
                .navigationTitle("감정 일기")
                // 탭바
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation {
                                shouldAddNewDiary.toggle()
                            }
                        } label: {
                            Image(systemName: "plus")
                        }
                        .disabled(shouldAddNewDiary) // 얼럿 뜬 상태에서 버튼 비활성화 (사용자 액션 제어)
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        NavigationLink(destination: {
                            EmotionChartView(diaryList: $diaryList)
                        }, label: {
                            Image(systemName: "chart.pie.fill")
                        })
                        .disabled(shouldAddNewDiary) // 얼럿 뜬 상태에서 버튼 비활성화 (사용자 액션 제어)
                    }
                }
                
                // 일기 추가하기 얼럿
                if shouldAddNewDiary {
                    AddDiaryAlert(shouldAddNewDiary: $shouldAddNewDiary) { newDiary in
                        self.diaryList.append(newDiary)
                        withAnimation {
                            shouldAddNewDiary.toggle()
                        }
                    }
                }
            }
        }
        
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
