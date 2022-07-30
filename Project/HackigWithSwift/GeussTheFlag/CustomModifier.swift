//
//  CustomModifier.swift
//  GeussTheFlag
//
//  Created by 마석우 on 2022/07/17.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content

    var body: some View {
        // more to come
        VStack {
            ForEach(0..<rows) { row in
                HStack{
                    ForEach(0..<columns) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

extension View {
    func LagrgeBlue() -> some View {
        modifier(LargeBlue())
    }
}

struct LargeBlue: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}

struct Title: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundColor(.blue)
            .padding()
            .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
struct CustomModifier: View {
    var body: some View {
        VStack {
            Text("hello world")
                .LagrgeBlue()
        }
        .foregroundColor(.red)
    }
}

struct CustomModifier_Previews: PreviewProvider {
    static var previews: some View {
        CustomModifier()
    }
}
