//
//  User.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/11/23.
//

import Foundation
import Firebase
enum AccountType: Int, Codable {
    case passenger
    case driver
}

struct User: Codable {
    let fullName: String
    let email: String
    let uid: String
    var coordinates: GeoPoint
    let accountType: AccountType
    var homeLocation: SavedLocation?
    var workLocation: SavedLocation?
}
