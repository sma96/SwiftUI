//
//  LocationManager.swift
//  MapList
//
//  Created by 마석우 on 2022/07/06.
//

import SwiftUI
import Foundation
import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject{
    var name = "sma"
    @Published var location: CLLocation?
    
    private let locationManager = CLLocationManager()
    
    override init() {
         super.init()
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
         locationManager.distanceFilter = kCLDistanceFilterNone
//        locationManager.requestLocation()
         locationManager.requestWhenInUseAuthorization() // 사용자에게 위치 접근 권한을 요청한다.
         locationManager.startUpdatingLocation()
         locationManager.delegate = self // CLLocationManger 클래스의 delegate 프로퍼티를 자신으로 설저 , delegate의 타입은 CLLocationMangerDelegate?
     }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            print("called locationManager")
            DispatchQueue.main.async {
                withAnimation{
                    self.location = location
                }
            }
    } // locationManager 함수는 새로운 위치 데이터를 delegate에게 알려준다.
        // manager parameter는 업데이트가 발생한 location manager 오브젝트이고
        // didUpdateLocations는 CLLocation의 배열 객체이고 location data를 가지고 있다. 최소 하나의 객체 데이터를 가지고 있는다.
        // 업데이트 된 순서대로 배열에 들어오기 때문에 가장 마지막 객체가 최신 위치 정보를 가지고 있다.
}

extension MKCoordinateRegion {
    
    static func goldenGateRegion() -> MKCoordinateRegion {
        MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.819527098978355, longitude:  -122.47854602016669), latitudinalMeters: 13000, longitudinalMeters: 13000)
    }
    
    func getBinding() -> Binding<MKCoordinateRegion>? {
        return Binding<MKCoordinateRegion>(.constant(self))
    }
}
