//
//  VroomApp.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/27/23.
//

import SwiftUI

@main
struct VroomApp: App {
    @StateObject var locationViewModel = SearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
            // allows us to have one instance that can be shared across entire app
                .environmentObject(locationViewModel)
        }
    }
}
