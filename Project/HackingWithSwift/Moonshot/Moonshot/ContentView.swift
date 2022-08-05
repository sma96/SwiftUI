//
//  ContentView.swift
//  Moonshot
//
//  Created by 마석우 on 2022/08/05.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: layout) {
                ForEach(0..<100) {
                    Text("Text \($0)")
                }
            }
        }
    }
}

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    let street: String
    let city: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
