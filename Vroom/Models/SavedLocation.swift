//
//  SavedLocation.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/12/23.
//

import Foundation
import Firebase

struct SavedLocation: Codable {
    let title: String
    let address: String
    let coordinates: GeoPoint
}
