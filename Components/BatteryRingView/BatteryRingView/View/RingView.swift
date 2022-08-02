//
//  RingView.swift
//  BatteryRingView
//
//  Created by 마석우 on 2022/08/02.
//

import SwiftUI

struct RingBackgroundShape: Shape {
    var thickness: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(
            center: CGPoint(x: rect.width / 2, y: rect.height / 2),
            radius: rect.width / 2 - thickness,
            startAngle: Angle(degrees: 0),
            endAngle:Angle(degrees: 360),
            clockwise: false
        )
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
}



struct RingShape: Shape {
    var currentPercentage: Double
    var thickness: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addArc(
            center: CGPoint(x: rect.width / 2 , y: rect.height / 2),
            radius: rect.width / 2 - thickness,
            startAngle: Angle(degrees: 0),
            endAngle: Angle(degrees: 360 * currentPercentage),
            clockwise: false
        )
        return path.strokedPath(.init(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }

    var animatableData: Double {
        get { return currentPercentage }
        set { currentPercentage = newValue }
    }
}

struct RingTipShape: Shape {
    var currentPercentage: Double
    var thickness: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()

        let angle = CGFloat((360 * currentPercentage) * .pi / 180)
        let controlRadius: CGFloat = rect.width / 2 - thickness
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let x = center.x + controlRadius * cos(angle)
        let y = center.y + controlRadius * sin(angle)
        let pointCenter = CGPoint(x: x, y: y)
        path.addEllipse(in:
            CGRect(
                x: pointCenter.x - thickness / 2,
                y: pointCenter.y - thickness / 2,
                width: thickness,
                height: thickness
            )
        )
        return path
    }

    var animatableData: Double {
        get { return currentPercentage }
        set { currentPercentage = newValue }
    }
}

struct RingView: View {
    @State private var currentPercentage: Double = 0
    @State private var dragAmount = CGSize.zero
    @State private var temp = CGSize.zero

    var percentage: Double
    var backgroundColor: Color
    var startColor: Color
    var endColor: Color
    var thickness: CGFloat


    var animation: Animation {
        Animation.easeInOut(duration: 1)
    }

    var body: some View {
        let gradient = AngularGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360 * currentPercentage))

        return ZStack{
            RingBackgroundShape(thickness: thickness)
                .rotationEffect(Angle(degrees: -90))
                .foregroundColor(backgroundColor)
            RingShape(currentPercentage: currentPercentage, thickness: thickness)
                .fill(gradient)
                .rotationEffect(Angle(degrees: -90))
                .shadow(radius: 2)
//                .drawingGroup()
                .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(self.animation) {
                        self.currentPercentage = self.percentage
                    }
                }
            }
            RingTipShape(currentPercentage: currentPercentage, thickness: thickness)
                .fill(currentPercentage > 1 ? endColor : endColor)
                .rotationEffect(Angle(degrees: -90))
                .onAppear() {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(self.animation) {
                            self.currentPercentage = self.percentage
                        }
                    }
                }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(
            percentage: 0.5,
            backgroundColor: Color.gray,
            startColor: Color("Color"),
            endColor: Color("Color"),
            thickness: 9
        )
            .frame(width: 100, height: 100)
            .aspectRatio(contentMode: .fit)
    }
}
