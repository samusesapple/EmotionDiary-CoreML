//
//  ContentView.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import SwiftUI

struct MainView: View {
    
    @State var diaryList: [Diary] = Diary.mockDiaries
    @State var shouldAddNewDiary: Bool = false // 새로운 일기 추가 얼럿 띄우기 여부
    
    // MARK: - View
    var body: some View {
        NavigationStack {
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
                    NavigationLink {
                        Text("새로운 일기 추가하는 view")
                    } label: {
                        Image(systemName: "plus")
                            .bold()
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        Text("여태 쓴 일기의 감정 통계 보여주는 차트")
                    } label: {
                        Image(systemName: "chart.pie.fill")
                            .foregroundColor(.green)
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
