//
//  ContentView.swift
//  DragGestureExample
//
//  Created by 마석우 on 2022/08/06.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var temp = CGSize.zero
    
        var body: some View {
            HStack(spacing: 0) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .animation(.default, value: enabled)
                        .offset(dragAmount)
                        .animation(.default.delay(Double(num) / 20), value: dragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged {
                        dragAmount = $0.translation
                        dragAmount.width += temp.width
                        dragAmount.height += temp.height
                    }
                    .onEnded { _ in
                        temp = dragAmount
                        enabled.toggle()
                    }
            )
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
