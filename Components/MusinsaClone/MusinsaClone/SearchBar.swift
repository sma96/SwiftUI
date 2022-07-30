//
//  SearchBar.swift
//  MusinsaClone
//
//  Created by 마석우 on 2022/07/14.
//

import SwiftUI

struct SearchBar: View {
    @State private var text = ""
    @State private var search = ""
    @FocusState private var textFocus: Bool
    
    var body: some View {
        VStack {
            HStack {
                TextField("첫사랑도 무신사랑❤️ 18% 할인 쿠폰", text: $text)
                    .frame(width: 300, height: 50, alignment: .leading)
                    .padding(.leading, 5)
                    .focused($textFocus)
                
                if textFocus == true && !text.isEmpty {
                    Spacer()
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "x.circle")
                            .foregroundColor(.gray)
                    }
                }
                Spacer()
                Button {
                    if text.isEmpty {
                        text = "검색어를 입력하세요"
                    } else {
                        text = "검색 완료 : " + text
                    }
                } label: {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 10)
            }
            .frame(width: 375)
            .background(.ultraThinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(text)
            Spacer()
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            SearchBar()
        }
    }
}
