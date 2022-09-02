//
//  ListLow.swift
//  MapList
//
//  Created by 마석우 on 2022/07/23.
//

import SwiftUI

import SwiftUI

struct CustomColor {
    static let myColor = Color("MyColor")
}
struct ListLow: View {
    var cadet: Cadet
    
    var body: some View {
        HStack {
            Circle()
                .frame(width: 20)
                .foregroundColor(getColor(cadet.coalitions).opacity(0.75))
                .padding(.leading, 10)
            Text(cadet.name)
                .font(.caption)
                .bold()
                .padding(5)
                .frame(width: 50, height: 50, alignment: .center)
            Text(" \(cadet.age)기")
                .font(.caption2)
                .frame(width: 20, height: 35, alignment: .center)
                .padding(.trailing, 10)
            Divider()
        }
        .frame(width: 370, height: 55, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10).fill(CustomColor.myColor).shadow(radius: 2))
//        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    func getColor(_ coalitions: Cadet.Coalitions) -> Color{
        switch coalitions{
        case .Gam:
            return Color.blue
        case .Gon:
            return Color.green
        case .Gun:
            return Color.yellow
        default:
            return Color.red
        }
    }
}

struct ListLow_Previews: PreviewProvider {
    static var previews: some View {
        ListLow(cadet: Cadet(name: "sma", age: 3, coalitions: .Gam, coordinates: Cadet.Coordinates(longitude: 127.065546, latitude: 37.4878346)))
    }
}
