//
//  PageView.swift
//  SwiftUItutorial
//
//  Created by 마석우 on 2022/06/27.
//

import SwiftUI

struct PageView: View {
    @EnvironmentObject var modelData: ModelData
    var featured: [Landmark] {
        modelData.landMarks.filter {
            $0.isFeatured
        }
    }
    
    var body: some View {
        TabView{
            ForEach(featured) {
                item in
                FeatureCard(landmark: item)
            }
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct PageView_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        PageView()
            .environmentObject(modelData)
    }
}
