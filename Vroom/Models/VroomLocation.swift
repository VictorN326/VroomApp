//
//  VroomLocation.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/11/23.
//

import Foundation
import CoreLocation
struct VroomLocation: Identifiable {
    let id = NSUUID().uuidString
    let title : String
    let coordinate: CLLocationCoordinate2D
}
