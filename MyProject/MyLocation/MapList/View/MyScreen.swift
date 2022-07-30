//
//  MapView.swift
//  MapList
//
//  Created by 마석우 on 2022/07/02.
//

import SwiftUI
import MapKit
import CoreLocation

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        .asymmetric(
                   insertion: .move(edge: .leading).combined(with: .opacity),
                   removal: .move(edge: .leading).combined(with: .opacity)
               )
    }
}

struct MyScreen: View {
    @ObservedObject var data: Data
    @ObservedObject var user: LocationManager
    
    init(data: Data)
    {
        self.data = data
        self.user = data.user
    }
    
//    var filteredCadets: [Cadet] {
//        return data.cadets.filter {
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
//
    var body: some View {
        VStack {
            ZStack {
                MapView(data: data)
                    .ignoresSafeArea(edges: .top)
                HDistanceSliderView(data: data)
            }
            .frame(height: 330)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 12) {
                    ForEach(data.filteredCadets) { cadet in
                        ListLow(cadet: cadet)
                    }
                    .transition(.moveAndFade)
                }
                .padding()
            }
//            Spacer()
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MyScreen(data: Data())
    }
}
