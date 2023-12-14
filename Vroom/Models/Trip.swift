//
//  Trip.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/13/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
enum tripState: Int, Codable {
    case requested
    case rejected
    case accepted
    case passengetCancelled
    case driverCancelled
}
struct Trip: Identifiable, Codable {
    @DocumentID var tripId: String?
    let passengerUid: String
    let driverUid: String
    let passengerName: String
    let driverName: String
    let passengerLocation: GeoPoint
    let driverLocation: GeoPoint
    let pickupLocationName: String
    let dropoffLocationName: String
    let pickupLocationAddress: String
    let pickupLocation: GeoPoint
    let dropoffLocation: GeoPoint
    let tripCost: Double
    
    var distanceToPassenger: Double
    var travelTimeToPassenger: Int
    var state : tripState
    
    var id: String {
        return tripId ?? ""
    }
}
