//
//  HDistanceSliderView.swift
//  MapList
//
//  Created by 마석우 on 2022/07/04.
//

import SwiftUI

struct HDistanceSliderView: View {
    @ObservedObject var data: Data
    @State private var distanceSliderButton: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 5) {
                Slider(value: $data.maxRange.animation(), in: 0.5...3, step: 0.1)
                    .frame(width: 100, height: 100)
                Text(String(format: "%.1f", data.maxRange) + " km")
                    .padding()
                    .font(.headline)
            }
            .frame(width: 225, height: 60)
            .background(.white.opacity(0.70))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .offset(y: distanceSliderButton ? -135 : -265)
            .animation(.easeIn, value: distanceSliderButton)
            
            HDistanceSliderButtonView(distanceSliderButton: $distanceSliderButton)
        }
    }
}

//struct HDistanceSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        HDistanceSliderView(Data())
//    }
//}
