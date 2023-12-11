//
//  RideType.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/11/23.
//

import Foundation
enum RideType: Int, CaseIterable, Identifiable {
    case VroomX
    case black
    case VroomXL
    
    var id: Int {return rawValue}
    var description: String {
        switch self {
        case .VroomX: return "VroomX"
        case .black: return "Black"
        case .VroomXL: return "VroomXL"
        }
    }
    var imageName: String {
        switch self {
        case .VroomX: return "vroom-x"
        case .black: return "vroom-black"
        case .VroomXL: return "vroomXL"
        }
    }
    
    var baseFare: Double {
        switch self {
        case .VroomX: return 5
        case .black: return 20
        case .VroomXL: return 10
        }
    }
    
    func computePrice(for distanceInMeters: Double) -> Double {
        let distanceInMiles = distanceInMeters / 1600
        
        switch self {
        case .VroomX: return distanceInMiles * 1.5 + baseFare
        case .black: return distanceInMiles * 2.0 + baseFare
        case .VroomXL: return distanceInMiles * 1.75 + baseFare
        }
    }
}
