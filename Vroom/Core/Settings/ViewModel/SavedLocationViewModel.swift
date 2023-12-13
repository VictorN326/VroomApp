//
//  SavedLocationViewModel.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/12/23.
//

import Foundation
import SwiftUI
// can scale to new favorite locations VERY EASILY such as favorite food place, gym, and many more!
enum SavedLocationViewModel: Int, CaseIterable, Identifiable {
    case home
    case work
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .work: return "Work"
        }
    }
    
    var imageName: String {
        switch self {
        case .home: return "house.circle.fill"
        case .work: return "archivebox.circle.fill"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .home: return Color(.systemBlue)
        case .work: return Color(.systemBrown)
        }
    }
    
    var subtitle: String {
        switch self {
        case .home: return "Add Home"
        case .work: return "Add Work"
        }
    }
    var databaseKey: String {
        switch self {
        case .home : return "homeLocation"
        case .work : return "workLocation"
        }
    }
    
    func subtitle(forUser user : User) -> String{
        switch self {
        case .home:
            if let homeLocation = user.homeLocation {
                return homeLocation.title
            } else {
                return "Add Home"
            }
            
        case .work:
            if let workLocation = user.workLocation  {
                return workLocation.title
            } else {
                return "Add Work"
            }
        }
    }
    var id: Int {return self.rawValue}
}
