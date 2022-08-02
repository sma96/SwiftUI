//
//  BatteryRingView.swift
//  BatteryRingView
//
//  Created by 마석우 on 2022/08/02.
//

import SwiftUI

struct CompleteRingView: View {
    var percentage: CGFloat
    
    var body: some View {
        ZStack {
            RingView(
                percentage: percentage,
                backgroundColor: Color.gray,
                startColor: Color("Color"),
                endColor: Color("Color"),
                thickness: 9
            )
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
        }
    }
}
struct BatteryRingView: View {
    @State private var temp = CGSize.zero
    @State private var isCharged = true
    
    var body: some View {
        
        ZStack {
            BlurView(style: .dark)
            VStack(spacing: 5) {
                HStack(spacing: 5) {
                    ZStack{
                        CompleteRingView(percentage: 0.85)
                        IphonImage(imageName: "iphone")
                        Image(systemName: "bolt.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(isCharged ? .white : .clear)
                            .frame(width: 15)
                            .offset(y: -41)
                        
                    }
                    ZStack {
                        CompleteRingView(percentage: 0.65)
                        AirpodView(imageName: "airpod.gen3.left")
                    }
                }
                HStack(spacing: 5) {
                    ZStack {
                        CompleteRingView(percentage: 0.4)
                        AirpodView(imageName: "airpod.gen3.right")
                    }
                    ZStack {
                        CompleteRingView(percentage: 0.9)
                        AirpodView(imageName: "airpodspro.chargingcase.wireless.fill")
                    }
                }
            }
        }
//        .frame(width: 250, height: 250)
        .clipShape(RoundedRectangle(cornerRadius: 35))
    }
}


struct BatteryRingView_Previews: PreviewProvider {
    static var previews: some View {
        BatteryRingView()
    }
}
