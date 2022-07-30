//
//  CricleImage.swift
//  SwiftUItutorial
//
//  Created by 마석우 on 2022/06/19.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    init(_ imagename: Image)
    {
        image = imagename
    }
    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

//struct CricleImage_Previews: PreviewProvider {
//    static var previews: some View {
//        CircleImage()
//    }
//}
