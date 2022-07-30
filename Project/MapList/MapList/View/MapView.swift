//
//  SwiftUIView.swift
//  MapList
//
//  Created by 마석우 on 2022/07/03.
//

import SwiftUI
import MapKit

struct MapView: View {
    var data: Data
    var user: LocationManager
    
    init(data: Data)
    {
        self.data = data
        self.user = data.user
    }
    
//    var filteredCadets: [Cadet] {
//        data.cadets.filter {
//            guard let location = user.location else{
//                return false
//            }
//            let coordinate_1 = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            let coordinate_2 = CLLocation(latitude: $0.locationCoordinate.latitude, longitude: $0.locationCoordinate.longitude)
//            let distance = coordinate_1.distance(from: coordinate_2)
//
//            return distance < (data.maxRange * 1000)
//        }
//    }
    
    var region2: Binding<MKCoordinateRegion>? {
        guard let location = user.location else {
               return MKCoordinateRegion.goldenGateRegion().getBinding()
           }
           let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000)

           return region.getBinding()
       }
    
    
    var body: some View {
        if let region2 = region2 {
            Map(coordinateRegion: region2, interactionModes: .all, showsUserLocation: true, annotationItems: data.filteredCadets) { cadet in
                    MapAnnotation(coordinate: cadet.locationCoordinate){
                            HStack {
                                Circle()
                                    .frame(width: 15)
                                    .foregroundColor(.red)
                            }
                        }
            }
//            .ignoresSafeArea()
         }
    }
}

//struct MapView: PreviewProvider {
//    static var previews: some View {
//        MapView()
//    }
//}
