//
//  MapViewController.swift
//  Day05
//
//  Created by 마석우 on 2022/08/23.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()
    var location: CLLocation?
    var trackingMode = false
    let annotation = MKPointAnnotation()
    var pin: MKAnnotation = MapModel.place.first!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        map.isZoomEnabled = true

        setAnnotation(annotation: pin)
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindToHome(_ unwindsegue: UIStoryboardSegue) {
        setAnnotation(annotation: pin)
    }
    
    func setAnnotation(annotation: MKAnnotation) {
        print("hello")
        map.addAnnotation(annotation)
        setRegion(latitude: pin.coordinate.latitude, longitude: pin.coordinate.longitude)
    }
    
    func setRegion(latitude: Double, longitude: Double) {
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        map.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("hello")
        if let location = locations.last, trackingMode == true {
            let latitude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
            map.setRegion(region, animated: true)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error = ")
        print(error)
    }

    @IBAction func locationUpdate(_ sender: UIButton) {
        if trackingMode == false {
            map.showsUserLocation = true
            map.setUserTrackingMode(.follow, animated: true)
            trackingMode = true
        } else {
            map.showsUserLocation = false
            map.setUserTrackingMode(.none, animated: false)
            trackingMode = false
        }
    }

    @IBAction func segmentBar(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            map.mapType = .standard
        case 1:
            map.mapType = .satellite
        default:
            map.mapType = .hybrid
        }
    }
    
}
