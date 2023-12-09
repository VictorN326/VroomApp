//
//  HomeView.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/27/23.
//

import SwiftUI

struct HomeView: View {
    @State private var showLocationSearch = false
    var body: some View {
        ZStack (alignment: .top) {
            VroomMapView().ignoresSafeArea()
            
            if showLocationSearch {
                SearchView(showLocationSearch: $showLocationSearch)
            } else {
                SearchActivateView().padding(.top, 72)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showLocationSearch.toggle()
                        }
                    }
            }
            
            MapViewAction(showLocationSearch: $showLocationSearch)
                .padding(.leading)
                .padding(.top, 4)
        }
    }
}

#Preview {
    HomeView()
}
