//
//  DistanceSliderButton.swift
//  MapList
//
//  Created by 마석우 on 2022/07/04.
//

import SwiftUI

struct HDistanceSliderButtonView: View {
    @Binding var distanceSliderButton: Bool
    @State private var y: CGFloat = 0
    
    var body: some View {
        Button{
            distanceSliderButton.toggle()
        }label: {
            Image(systemName: "chevron.compact.down")
                .offset(y: y)
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: true))
                .imageScale(.large)
                .foregroundColor(.blue)
                .font(Font.title.weight(.semibold))
                .rotationEffect(Angle(degrees: distanceSliderButton ? -180 : 0))
                .onAppear{
                    self.y = -5
                }
        }
        .offset(y: distanceSliderButton ? -125 : -185)
        .animation(.easeIn, value: distanceSliderButton)
    }
}

//struct DistanceSliderButton_Previews: PreviewProvider {
//    static var previews: some View {
//        @State private var distanceSliderButton: Bool = false
//
//        DistanceSliderButtonView(distanceSliderButton: $distanceSliderButton)
//    }
//}
