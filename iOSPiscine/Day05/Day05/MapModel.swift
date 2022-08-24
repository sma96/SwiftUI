//
//  MapModel.swift
//  Day05
//
//  Created by 마석우 on 2022/08/23.
//

import Foundation
import CoreLocation
import MapKit

struct MapModel {
    static var place: [MKAnnotation] = [
        MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: 55.79714, longitude: 37.57983), title: "School 21", subtitle: "Moscow Campus"),
    MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: 48.89662, longitude: 2.31851),
                                 title: "42",
                                 subtitle: "Paris Campus"),
    MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: 45.77966, longitude: 4.75065),
                      title: "42",
                      subtitle: "Lyon Campus"),
    MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: 52.42673, longitude: 10.78987),
                      title: "42",
                      subtitle: "Wolfsburg Campus")]
}
