//
//  ContentView.swift
//  BatteryRingView
//
//  Created by 마석우 on 2022/08/02.
//

import SwiftUI
import UIKit


struct ContentView: View {
    
    var body: some View {
            BatteryRingView()
                .frame(width: 250, height: 250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
