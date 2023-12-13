//
//  HomeView.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/27/23.
//

import SwiftUI

struct HomeView: View {
    @State private var mapState = MapViewState.noInput
    @State private var showSideMenu = false
    @EnvironmentObject var locationViewModel: SearchViewModel
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                LoginView()
            }else if let user = authViewModel.currentUser {
                NavigationStack {
                    ZStack {
                        if showSideMenu {
                            SideMenuView(user: user)
                        }
                        mapView
                            .offset(x: showSideMenu ? 316: 0 )
                            .shadow(color: showSideMenu ? .black : .clear, radius: 10 )
                    }
                    .onAppear(perform: {
                        showSideMenu = false
                        authViewModel.refreshUser()
                    })
                }

            }
        }
    }
}

extension HomeView {
    var mapView: some View {
        ZStack(alignment: .bottom) {
            ZStack (alignment: .top) {
                VroomMapView(mapState: $mapState).ignoresSafeArea()
                
                if mapState == .searchingForLocation {
                    SearchView()
                } else if mapState == .noInput{
                    SearchActivateView().padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                mapState = .searchingForLocation
                            }
                        }
                }
                
                MapViewAction(mapState: $mapState,showSideMenu: $showSideMenu)
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
            .onReceive(locationViewModel.$selectedVroomLocation, perform: {location in
                if location != nil {
                    self.mapState = .locationSelected
                }
            })
    }
}
#Preview {
    HomeView().environmentObject(AuthenticationViewModel())
}
