//
//  MapViewAction.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/28/23.
//

import SwiftUI

struct MapViewAction: View {
    @Binding var mapState: MapViewState
    @Binding var showSideMenu: Bool
    @EnvironmentObject var viewModel: SearchViewModel
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    
    var body: some View {
        Button{
            withAnimation(.spring()){
                actionForState(mapState)
            }
        }label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: .black,radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    func actionForState(_ state: MapViewState) {
        switch state {
        case .noInput:
            showSideMenu.toggle()
        case .searchingForLocation:
            mapState = .noInput
            
        case .locationSelected, .polylineAdded:
//            print("DEBUG: Clear map view...")
            mapState = .noInput
            viewModel.selectedVroomLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String{
        switch state {
        case .noInput:
            return "line.3.horizontal"
            
        case .searchingForLocation, .locationSelected, .polylineAdded:
            return "arrow.left"
        default:
            return "line.3.horizontal"
        
        }
    }
}

#Preview {
    MapViewAction(mapState: .constant(.noInput), showSideMenu: .constant(false))
}
