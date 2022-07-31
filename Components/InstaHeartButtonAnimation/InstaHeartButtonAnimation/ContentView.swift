//
//  ContentView.swift
//  InstaHeartButtonAnimation
//
//  Created by 마석우 on 2022/07/31.
//

import SwiftUI

struct ContentView: View {
    @State private var isLiked = false
    
    var body: some View {
        ZStack {
            HeartButton(isLiked: $isLiked)
        }
    }
}

struct HeartButton: View {
    @Binding var isLiked: Bool
    @State var animate = false
    
    var animateAmount: CGFloat {
        isLiked ? 1.3 : 0.7
    }
    
    var body: some View {
        Button {
            animate.toggle()
            isLiked.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                animate.toggle()
            }
        } label: {
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100)
                .foregroundColor(isLiked ? .red : .gray)
                .animation(.easeIn(duration: 0.2), value: isLiked)
        }
        .scaleEffect(animate ? animateAmount : 1)
        .animation(.easeInOut(duration: 0.1), value: animate)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
