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
}
