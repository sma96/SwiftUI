//
//  ContentView.swift
//  RingView
//
//  Created by 마석우 on 2022/07/30.
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
                .fill(currentPercentage > 1 ? endColor : .clear)
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

struct RingCircleShape: Shape {
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

struct ContentView: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var temp = CGSize.zero
    @State private var percentage = 0.6


        var body: some View {
            ZStack {
                RingView(
                    percentage: percentage,
                    backgroundColor: Color.gray,
                    startColor: Color.red,
                    endColor: Color.blue,
                    thickness: 20
                )
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fit)
//                RingCircleShape(currentPercentage: percentage, thickness: 20)
//                    .rotationEffect(Angle(degrees: -90))
//                    .frame(width: 150, height: 150)
//                    .aspectRatio(contentMode: .fit)
//                    .gesture(
//                        DragGesture()
//                            .onChanged {
//                                let hypotenuse: CGFloat
//
//                                dragAmount = $0.translation
//
//                                let angle = CGFloat((360 * percentage) * .pi / 180)
//                                let controlRadius: CGFloat = 150 / 2 - 20
//                                let center = CGPoint(x: 150 / 2, y: 150 / 2)
////                                print("\(x), \(y)")
//
//                                let x = center.x + controlRadius * cos(angle)
//                                let y = center.y + controlRadius * sin(angle)
//
//                                dragAmount.width += x
//                                dragAmount.height += y
//
//                                hypotenuse = sqrt(pow(dragAmount.width, 2) + pow(dragAmount.height, 2))
//                                let myWidth = (((150 / 2 - 20) + 75) * dragAmount.width) / hypotenuse
//                                let myHeight = (((150 / 2 - 20) + 75) * dragAmount.height) / hypotenuse
//                                var theta = (180 / CGFloat.pi) * atan2(myWidth,myHeight)
//
////                                theta = theta < 0 ? -theta : theta
//                                percentage = theta / 360
//                                                            }
//                            .onEnded { _ in
////                                temp = dragAmount
//                            }
//                    )

            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
