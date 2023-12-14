//
//  DeveloperPreview.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/13/23.
//

import Foundation
import SwiftUI
import Firebase
extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}
class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let mockTrip = Trip(
        passengerUid: NSUUID().uuidString,
        driverUid: NSUUID().uuidString,
        passengerName: "Victor Nguyen",
        driverName: "Dominic Toretto",
        passengerLocation: .init(latitude: 37.123, longitude: -122.1),
        driverLocation: .init(latitude: 37.123, longitude: -122.1),
        pickupLocationName: "Apple Campus",
        dropoffLocationName: "Starbucks",
        pickupLocationAddress: "800 N State College Blvd",
        pickupLocation: .init(latitude: 37.456, longitude: -122.15),
        dropoffLocation: .init(latitude: 37.042, longitude: -122.22),
        tripCost: 47.5,
        distanceToPassenger: 1000,
        travelTimeToPassenger: 24,
        state: .rejected
    )
    
    let mockUser = User(fullName: "Victor Nguyen", email: "test@gmail.com", uid: NSUUID().uuidString, coordinates: GeoPoint(latitude: 37.38, longitude: -122.05), accountType: .passenger, homeLocation: nil,
workLocation: nil)
}
