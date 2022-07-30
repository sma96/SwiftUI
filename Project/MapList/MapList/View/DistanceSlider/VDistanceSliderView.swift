//
//  DistanceSliderView.swift
//  MapList
//
//  Created by 마석우 on 2022/07/04.
//

import SwiftUI

struct VDistanceSliderView: View {
    @ObservedObject var data: Data
    @State private var distanceSliderButton: Bool = false
    
    var body: some View {
        HStack {
            VStack {
                Slider(value: $data.maxRange.animation(), in: 0.5...3, step: 0.1)
                    .frame(width: 100, height: 125)
                    .rotationEffect(Angle(degrees: -90))
                Text(String(format: "%.1f", data.maxRange) + " km")
                    .padding()
                    .font(.headline)
            }
            .frame(width: 60)
            .background(.white.opacity(0.70))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .offset(x: distanceSliderButton ? 165 : 250)
            .animation(.easeIn, value: distanceSliderButton)
            
            VDistanceSliderButtonView(distanceSliderButton: $distanceSliderButton)
            
        }
    }
}

//struct VDistanceSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        VDistanceSliderView(Data())
//    }
//}
