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
//    @EnvironmentObject var locationViewModel: SearchViewModel
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @EnvironmentObject var homeViewModel : HomeViewModel
    
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
            if let user = authViewModel.currentUser{
                homeViewModel.viewForState(mapState, user: user)
                    .transition(.move(edge: .bottom))
            }
        }
            .edgesIgnoringSafeArea(.bottom)
            .onReceive(LocationManager.shared.$userLocation, perform: { location in
            if let location = location {
//                print("DEBUG: User location in home view is \(location)")
                homeViewModel.userLocation = location
            }
        })
            .onReceive(homeViewModel.$selectedVroomLocation, perform: {location in
                if location != nil {
                    self.mapState = .locationSelected
                }
            })
            .onReceive(homeViewModel.$trip) { trip in
                guard let trip = trip else {
                    self.mapState = .noInput
                    return
                }
                
                withAnimation(.spring()) {
                    switch trip.state {
                    case .requested:
                        self.mapState = .tripRequested
                    case .rejected:
                        self.mapState = .tripRejected
                    case .accepted:
                        self.mapState = .tripAccepted
                    case .passengetCancelled:
                        self.mapState = .tripCancelledByPassenger
                        print("DEBUG: Passenger cancelled Trip")
                    case .driverCancelled:
                        self.mapState = .tripCancelledByDriver
                        print("DEBUG: Driver cancelled trip")
                    }
                }
            }
    }
}
#Preview {
    HomeView().environmentObject(AuthenticationViewModel())
}
