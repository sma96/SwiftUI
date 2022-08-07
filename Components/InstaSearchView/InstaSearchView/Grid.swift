//
//  Grid.swift
//  InstaSearchView
//
//  Created by 마석우 on 2022/08/06.
//

import SwiftUI

struct Grid: View {
    
    var photo: [[String]]
    var video: [String] = ["stmarylake", "icybay"]
    
    init(_ photo: [String]) {
        var tempPhoto = [[String]]()
        var tmp = [String]()
        
        for img in photo {
            tmp.append(img)
            if tmp.count == 4 {
                tempPhoto.append(tmp)
                tmp.removeAll()
            }
        }
        if !tmp.isEmpty {
            tempPhoto.append(tmp)
        }
        self.photo = tempPhoto
    }

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 1) {
                    ForEach(photo.indices) { i in
                        if i % 2 == 0 {
                            HStack(alignment: .top, spacing: 1) {
                                fourGrid(photo[i], proxy.size)
                                longImgage(text: video[i % 2], viewSize: proxy.size)
                            }
                        } else {
                            HStack(alignment: .top, spacing: 1) {
                                longImgage(text: video[i % 2], viewSize: proxy.size)
                                fourGrid(photo[i], proxy.size)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct fourGrid: View {
    
    var photo: [String]
    var count: Int = 0
    var viewSize: CGSize
    
    init(_ photo: [String], _ size: CGSize)
    {
        let temp = photo.count
        
        if temp >= 2 {
            self.count = 2
        } else {
            self.count = temp
        }
        self.photo = photo
        self.viewSize = size
    }
    
    var body: some View {
        return VStack(alignment: .center, spacing: 1) {
            HStack(spacing: 1){
                ForEach(0..<count) { i in
                    Image(photo[i])
                        .resizable()
                        .frame(width: count == 1 ? (viewSize.width / 3 * 2) - 3 : (viewSize.width / 3) - 2 , height: count == 1 ? (viewSize.width / 3 * 2) - 4 : (viewSize.width / 3) - 2)
                        .scaleEffect()
                    
                }
            }
            HStack(spacing: 1){
                ForEach(0..<(photo.count - count)) { i in
                    Image(photo[i + 2])
                        .resizable()
                        .frame(width: photo.count - count == 1 ? (viewSize.width / 3 * 2) - 3 : (viewSize.width / 3) - 2 , height: photo.count - count == 1 ? (viewSize.width / 3) - 2 : (viewSize.width / 3) - 2)
                        .scaleEffect()
                    
                }
            }
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct longImgage: View {
    var text: String
    var viewSize: CGSize
    
    var body: some View {
        Image(text)
            .resizable()
            .frame(width: viewSize.width / 3 - 2, height: (viewSize.width * (2 / 3)) - 3)
            .scaleEffect()
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid(["kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii","kawaiii"])
    }
}
