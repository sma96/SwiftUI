//
//  Labels.swift
//  InstaSearchView
//
//  Created by 마석우 on 2022/08/06.
//

import SwiftUI

struct Labels: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Label(text: "Design")
                Label(text: "Code")
                Label(text: "UI")
                Label(text: "Dog")
                Label(text: "Travel")
                Label(text: "Food")
            }
            .padding(.horizontal, 16)
            .frame(width: .infinity, height: 38)
        }
    }
}

struct Labels_Previews: PreviewProvider {
    static var previews: some View {
        Labels()
    }
}
