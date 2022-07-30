//
//  LandmarkDetail.swift
//  SwiftUItutorial
//
//  Created by 마석우 on 2022/06/22.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landMarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(landmark)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            CircleImage(landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landMarks[landmarkIndex].isFavorite)
                }
                HStack{
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                    .background(.black)
                    .frame(width:365)
                
                Text("About \(landmark.name)")
                    .font(.headline)
                Text(landmark.description)
            }
            .padding()
            
//            Spacer()
            .navigationTitle(landmark.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

       static var previews: some View {
           LandmarkDetail(landmark: modelData.landMarks[0])
               .environmentObject(modelData)
       }
}
