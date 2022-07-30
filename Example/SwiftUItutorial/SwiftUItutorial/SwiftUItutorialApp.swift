//
//  SwiftUItutorialApp.swift
//  SwiftUItutorial
//
//  Created by 마석우 on 2022/06/19.
//

import SwiftUI

@main
struct SwiftUItutorialApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
