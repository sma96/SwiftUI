//
//  ContentView.swift
//  InstaSearchView
//
//  Created by 마석우 on 2022/08/06.
//

import SwiftUI

struct ContentView: View {
    
    var photo: [String] = ["kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii"]
    var body: some View {
        VStack(spacing: 10) {
            SearchInput()
                .padding(.horizontal, 16)
            
            Labels()
            Spacer()
            
            Grid(photo)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
