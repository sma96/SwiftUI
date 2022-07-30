//
//  VDistanceButtonView.swift
//  MapList
//
//  Created by 마석우 on 2022/07/04.
//

import SwiftUI

struct VDistanceSliderButtonView: View {
    @Binding var distanceSliderButton: Bool
    @State private var x: CGFloat = 0

    
    var body: some View {
        Button{
            distanceSliderButton.toggle()
        }label: {
            Image(systemName: "chevron.compact.left")
                .offset(x: x)
                .animation(.easeOut(duration: 1).repeatForever(autoreverses: true))
                .foregroundColor(.blue)
                .font(Font.title.weight(.semibold))
                .rotationEffect(Angle(degrees: distanceSliderButton ? -180 : 0))
                .onAppear{
                    self.x = -5
                }
        }
        .offset(x: distanceSliderButton ? 70 : 145)
        .animation(.easeIn, value: distanceSliderButton)
    }
}

//struct VDistanceButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        VDistanceButtonView()
//    }
//}
