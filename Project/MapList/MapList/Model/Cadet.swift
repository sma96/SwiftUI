//
//  Model.swift
//  MapList
//
//  Created by 마석우 on 2022/07/02.
//

import SwiftUI
import CoreLocation
import Foundation

struct Cadet: Identifiable{
    var id = UUID()
    var name: String
    var age: Int
    var coalitions: Coalitions
    
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable{
        var longitude: Double
        var latitude: Double
    }
    
    enum Coalitions{
        case Gam
        case Gon
        case Gun
        case Lee
    }
}
