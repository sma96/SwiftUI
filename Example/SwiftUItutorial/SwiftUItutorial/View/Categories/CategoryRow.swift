//
//  CategoryView.swift
//  SwiftU:
//
//  Created by 마석우 on 2022/06/26.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]

    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .shadow(color: .gray, radius: 10)
                .padding(.leading)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top){
                    ForEach(items) { item in
                        NavigationLink{
                            LandmarkDetail(landmark: item)
                        } label: {
                            CategoryItem(landmark: item)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landMarks
    
    static var previews: some View {
        CategoryRow(
                   categoryName: landmarks[0].category.rawValue,
                   items: Array(landmarks.prefix(3))
               )
    }
}
