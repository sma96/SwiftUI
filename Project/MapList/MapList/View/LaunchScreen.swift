//
//  LaunchScreen.swift
//  MapList
//
//  Created by 마석우 on 2022/07/18.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack {
            Color.white
            
            VStack(alignment: .leading) {
                Text("My")
                Text("Location Service")
                Text("                  Project")
            }
            .font(.headline)
            .foregroundColor(.black)
        }
        .waterMark(text: "Designed by sma")
        .ignoresSafeArea()
        .transition(.opacity)
        .zIndex(1)
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
