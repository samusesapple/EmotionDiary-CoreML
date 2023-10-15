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
            .navigationTitle("감정 일기")
            .toolbar {
                NavigationLink {
                    Text("새로운 일기 추가하는 view")
                } label: {
                    Image(systemName: "plus")
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
