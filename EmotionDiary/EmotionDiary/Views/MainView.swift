//
//  ContentView.swift
//  EmotionDiary
//
//  Created by Sam Sung on 2023/10/15.
//

import SwiftUI

struct MainView: View {
    
    
    // MARK: - View
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    DiaryView(diary: Diary.mockDiarys[3])
                }
            }
            .padding()
            .navigationTitle("감정 일기")
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
