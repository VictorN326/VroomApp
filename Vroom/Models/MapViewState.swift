//
//  MapViewState.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/9/23.
//

import Foundation

//Help manage state across application and run different task based on state
enum MapViewState {
    case noInput
    case locationSelected
    case searchingForLocation
    case polylineAdded
    case tripRequested
    case tripAccepted
    case tripRejected
    case tripCancelledByPassenger
    case tripCancelledByDriver
}
