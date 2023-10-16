//
//  DiaryListView.swift
//  EmotionDiary
//
//  Created by dev on 2023/10/16.
//

import SwiftUI

struct DiaryListView: View {
    
    var diaryList: [Diary]
    
    // MARK: - View
    var body: some View {
        ScrollView {
            ForEach(diaryList, id: \.self) { diary in
                DiaryView(diary: diary)
                    .padding(.horizontal)
            }
        }
    }
}

struct DiaryListView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryListView(diaryList: Diary.mockDiaries)
    }
}
