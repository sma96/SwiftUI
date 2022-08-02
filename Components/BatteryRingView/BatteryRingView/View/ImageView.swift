//
//  ImageView.swift
//  BatteryRingView
//
//  Created by 마석우 on 2022/08/02.
//

import SwiftUI

struct IphonImage: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(.gray)
            .cornerRadius(5.5)
            .frame(width: 25)
            .foregroundColor(.white)
    }
}

struct AirpodView: View {
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(5.5)
            .frame(width: 25)
            .foregroundColor(.white)
    }
}

