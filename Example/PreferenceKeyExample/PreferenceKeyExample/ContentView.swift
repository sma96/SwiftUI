//
//  ContentView.swift
//  PreferenceKeyExample
//
//  Created by 마석우 on 2022/07/31.
//

import SwiftUI

struct ContentView: View {
    @State var activeMonth: Int = 0
    @State private var rects: [CGRect] = Array<CGRect>(repeating: CGRect(), count: 12)
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .foregroundColor(.green)
                .frame(width: rects[activeMonth].size.width, height: rects[activeMonth].size.height)
                .offset(x: rects[activeMonth].minX, y: rects[activeMonth].minY)
            
            VStack(spacing: 10) {
                Spacer()
                HStack {
                    MonthView(month: "1월", idx: 0, activeMonth: $activeMonth)
                    MonthView(month: "2월", idx: 1, activeMonth: $activeMonth)
                    MonthView(month: "3월", idx: 2, activeMonth: $activeMonth)
                    MonthView(month: "4월", idx: 3, activeMonth: $activeMonth)
                }
                Spacer()
                HStack {
                    MonthView(month: "5월", idx: 4, activeMonth: $activeMonth)
                    MonthView(month: "6월", idx: 5, activeMonth: $activeMonth)
                    MonthView(month: "7월", idx: 6, activeMonth: $activeMonth)
                    MonthView(month: "8월", idx: 7, activeMonth: $activeMonth)
                }
                Spacer()
                HStack {
                    MonthView(month: "9월", idx: 8, activeMonth: $activeMonth)
                    MonthView(month: "10", idx: 9, activeMonth: $activeMonth)
                    MonthView(month: "11월", idx: 10, activeMonth: $activeMonth)
                    MonthView(month: "12월", idx: 11, activeMonth: $activeMonth)
                }
                Spacer()
            }
            .onPreferenceChange(MyTextPreferenceKey.self) { preferences in
                for p in preferences {
                    print("\(p.viewIdx)")
                    self.rects[p.viewIdx] = p.rect
                }
            }
        }
        .coordinateSpace(name: "myZstack")
    }
}

struct MonthView: View {
    var month: String
    var idx: Int
    @Binding var activeMonth: Int
    
    var body: some View {
        Text(month)
            .font(.headline)
            .fontWeight(.bold)
            .padding(10)
            .background(MyPreferenceViewSetter(idx: idx))
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.6)) {
                    activeMonth = idx
                }
            }
//            .background(activeMonth == idx ? RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.red) : RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2).foregroundColor(.clear))
//            .foregroundColor(.black)
    }
}

struct MyPreferenceViewSetter: View {
    var idx: Int
    
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(.clear)
                .preference(key: MyTextPreferenceKey.self, value: [MyTextPreferenceData(viewIdx: idx, rect: proxy.frame(in: .named("myZstack")))])
        }
    }
}

struct MyTextPreferenceData: Equatable {
    let viewIdx: Int
    let rect: CGRect
}

struct MyTextPreferenceKey: PreferenceKey {
//    typealias Value = [MyTextPreferenceData]

    static var defaultValue: [MyTextPreferenceData] = []
    
    static func reduce(value: inout [MyTextPreferenceData], nextValue: () -> [MyTextPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
