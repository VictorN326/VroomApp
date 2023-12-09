//
//  LocationManager.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/27/23.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        // gives the most best accurate location for users
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // app to request user location and ask for certain permissions
        locationManager.requestWhenInUseAuthorization()
        // update user location to for us to access it as live as possible
        locationManager.startUpdatingLocation()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard !locations.isEmpty else {return}
//        print(locations.first)
        locationManager.stopUpdatingLocation()
    }
}
