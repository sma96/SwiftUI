//
//  ContentView.swift
//  InstaStoryCircle
//
//  Created by 마석우 on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Image("1")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .stroke(lineWidth: 3.5)
                    .fill(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .purple,.pink, .red]), center: .center))
            }
            .overlay {
                Circle()
                    .stroke(lineWidth: 3.5)
                    .frame(width: 93)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
