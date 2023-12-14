//
//  GeoPoint.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/13/23.
//

import Foundation
import Firebase
import CoreLocation
extension GeoPoint {
    func toCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
