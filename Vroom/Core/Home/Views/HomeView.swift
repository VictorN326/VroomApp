//
//  HomeView.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/27/23.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @EnvironmentObject var locationViewModel: SearchViewModel
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                LoginView()
            }else {
                ZStack(alignment: .bottom) {
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
                    if mapState == .locationSelected || mapState == .polylineAdded {
                        RideRequest()
                            .transition(.move(edge: .bottom))
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .onReceive(LocationManager.shared.$userLocation, perform: { location in
                    if let location = location {
        //                print("DEBUG: User location in home view is \(location)")
                        locationViewModel.userLocation = location
                    }
                })
            }
        }
    }
}

#Preview {
    HomeView()
}
