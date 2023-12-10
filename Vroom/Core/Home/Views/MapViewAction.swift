//
//  MapViewAction.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/28/23.
//

import SwiftUI

struct MapViewAction: View {
    @Binding var mapState: MapViewState
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
            print("DEBUG: No input")
            
        case .searchingForLocation:
            mapState = .noInput
            
        case .locationSelected:
//            print("DEBUG: Clear map view...")
            mapState = .noInput
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String{
        switch state {
        case .noInput:
            return "line.3.horizontal"
            
        case .searchingForLocation, .locationSelected:
            return "arrow.left"
        }
    }
}

#Preview {
    MapViewAction(mapState: .constant(.noInput))
}
