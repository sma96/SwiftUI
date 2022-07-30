//
//  MapView.swift
//  SwiftUItutorial
//
//  Created by 마석우 on 2022/06/19.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion
    var landmark =  [Landmark]()

    init(_ landmark: Landmark){
        self.region = MKCoordinateRegion(center: landmark.locationCoordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.landmark.insert(landmark, at: 0)
    }
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: landmark){
                item in
                MapAnnotation(coordinate: item.locationCoordinate){
                    item.image
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.white, lineWidth: 2.5))
                        .shadow(radius: 7)
                }
            }
        }
        
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
