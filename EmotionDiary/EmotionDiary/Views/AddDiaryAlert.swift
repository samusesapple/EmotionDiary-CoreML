//
//  AddDiaryAlert.swift
//  EmotionDiary
//
//  Created by dev on 2023/10/16.
//

import SwiftUI

struct AddDiaryAlert: View {
    
    @Binding var shouldPresentAlert: Bool
    @Binding var title: String
    @Binding var detail: String
    
    init(shouldPresentAlert: Binding<Bool> = .constant(false), title: Binding<String> = .constant(""), detail: Binding<String> = .constant("")) {
        self._shouldPresentAlert = shouldPresentAlert
        self._title = title
        self._detail = detail
    }
    // MARK: - View
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("새로운 일기 쓰기")
                    .font(.system(size: 20, weight: .bold))
                
                Spacer()
                
                Button {
                    print("""
제목: \(title)
내용: \(detail)
""")
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
            
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}

struct AddDiaryAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddDiaryAlert()
    }
}
