//
//  MapViewAction.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/28/23.
//

import SwiftUI

struct MapViewAction: View {
    @Binding var showLocationSearch: Bool
    var body: some View {
        Button{
            withAnimation(.spring()){
                showLocationSearch.toggle()
            }
        }label: {
            Image(systemName: showLocationSearch ? "arrow.left" : "line.3.horizontal")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .shadow(color: .black,radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

#Preview {
    MapViewAction(showLocationSearch: .constant(true))
}
