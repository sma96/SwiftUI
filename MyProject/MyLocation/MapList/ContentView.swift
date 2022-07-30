//
//  ContentView.swift
//  MapList
//
//  Created by 마석우 on 2022/07/02.
//

import SwiftUI

extension View {
    
    func waterMark(text: String) -> some View {
        return modifier(waterMarked(watermark: text))
    }
}

struct waterMarked: ViewModifier {
    var watermark: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottom) {
            content
            Text(watermark)
                .font(.subheadline)
                .foregroundColor(.black)
                .padding(15)
        }
    }
}

struct ContentView: View {
    @State private var showLaunch: Bool = true
    var data = Data()
    
    var body: some View {
        ZStack {
            MyScreen(data: data)
            if showLaunch {
                LaunchScreen()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation{
                    showLaunch.toggle()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
