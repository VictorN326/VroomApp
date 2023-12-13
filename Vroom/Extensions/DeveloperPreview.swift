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
    
    let mockUser = User(fullName: "Victor Nguyen", email: "test@gmail.com", uid: NSUUID().uuidString, coordinates: GeoPoint(latitude: 37.38, longitude: -122.05), accountType: .passenger, homeLocation: nil,
workLocation: nil)
}
