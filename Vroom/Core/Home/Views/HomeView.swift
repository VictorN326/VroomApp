//
//  HomeView.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/27/23.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    var body: some View {
        ZStack (alignment: .top) {
            VroomMapView(mapState: $mapState).ignoresSafeArea()
            
            if mapState == .searchingForLocation {
                SearchView(mapState: $mapState)
            } else if mapState == .noInput{
                SearchActivateView().padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            mapState = .searchingForLocation
                        }
                    }
            }
            
            MapViewAction(mapState: $mapState)
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

#Preview {
    HomeView()
}
