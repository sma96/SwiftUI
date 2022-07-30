//
//  LandmarkRow.swift
//  SwiftUItutorial
//
//  Created by 마석우 on 2022/06/22.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text(landmark.name)
            
            Spacer()
            if landmark.isFavorite{
                Image(systemName:"star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

//struct LandmarkRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LandmarkRow(landmark: landMarks[1])
//            LandmarkRow(landmark: landMarks[3])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
//    }
//}
