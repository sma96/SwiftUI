//
//  ModelData.swift
//  MapList
//
//  Created by 마석우 on 2022/07/03.
//

import SwiftUI
import CoreLocation
import MapKit

class Data: ObservableObject {
    
    var user: LocationManager = LocationManager()
    
    @Published var coordi: MKCoordinateRegion?
    
    var spanLatitude: Measurement<UnitLength>{
        return Measurement(value: maxRange, unit: UnitLength.meters)
    }
    
    var filteredCadets: [Cadet] {
        return cadets.filter {
            guard let location = user.location else{
                return false
            }
            let coordinate_1 = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let coordinate_2 = CLLocation(latitude: $0.locationCoordinate.latitude, longitude: $0.locationCoordinate.longitude)
            let distance = coordinate_1.distance(from: coordinate_2)
            
            return distance < (maxRange * 1000)
        }
    }
    
    var cadets: [Cadet] = [Cadet(name: "sma", age: 3, coalitions: .Gam, coordinates: Cadet.Coordinates(longitude: 127.065546, latitude: 37.4878346)), Cadet(name: "ybong", age: 3, coalitions: .Gon, coordinates: Cadet.Coordinates(longitude: 127.065949, latitude: 37.4928222)), Cadet(name: "hyos", age: 3, coalitions: .Gon, coordinates: Cadet.Coordinates(longitude: 127.058646, latitude: 37.4783195)), Cadet(name: "jwoo", age: 3, coalitions: .Gon, coordinates: Cadet.Coordinates(longitude: 127.086795, latitude: 37.4701994)),
                           Cadet(name: "clim", age: 3, coalitions: .Gam, coordinates: Cadet.Coordinates(longitude: 127.064889, latitude: 37.487086)), Cadet(name: "minsikim", age: 3, coalitions: .Lee, coordinates: Cadet.Coordinates(longitude: 127.0551796, latitude: 37.4944804)), Cadet(name: "jin-lee", age: 3, coalitions: .Gon, coordinates: Cadet.Coordinates(longitude: 127.0383829, latitude: 37.5049267)), Cadet(name: "minkang", age: 3, coalitions: .Gon, coordinates: Cadet.Coordinates(longitude: 127.086795, latitude: 37.4701994)),
                           Cadet(name: "hyoj", age: 3, coalitions: .Gam, coordinates: Cadet.Coordinates(longitude: 127.082512, latitude: 37.504074)), Cadet(name: "some", age: 3, coalitions: .Gon, coordinates: Cadet.Coordinates(longitude: 127.048536, latitude: 37.513736)), Cadet(name: "things", age: 3, coalitions: .Gon, coordinates: Cadet.Coordinates(longitude: 127.058646, latitude: 37.4783195)), Cadet(name: "ccc", age: 3, coalitions: .Gun, coordinates: Cadet.Coordinates(longitude: 127.0213324, latitude: 37.509404)),
                           Cadet(name: "dkksk", age: 3, coalitions: .Gam, coordinates: Cadet.Coordinates(longitude: 127.041530, latitude: 37.483746)), Cadet(name: "nanan", age: 3, coalitions: .Lee, coordinates: Cadet.Coordinates(longitude: 127.0564747, latitude: 37.4630595)), Cadet(name: "ssss", age: 3, coalitions: .Gon, coordinates: Cadet.Coordinates(longitude: 127.121370, latitude: 37.4708368)), Cadet(name: "ff", age: 3, coalitions: .Gun, coordinates: Cadet.Coordinates(longitude: 127.048219, latitude: 37.525737))]
    
    @Published var maxRange: Double = 0.5 // km
//    var range: Double {
//        get {
//            maxRange
//        }
//        set {
//            maxRange = newValue
//        }
//    }
}
