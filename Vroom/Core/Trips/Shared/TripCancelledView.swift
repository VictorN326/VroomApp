//
//  TripCancelledView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/13/23.
//

import SwiftUI

struct TripCancelledView: View {
    @EnvironmentObject var viewModel:HomeViewModel
    var body: some View {
        VStack {
            Capsule().foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            Text(viewModel.tripCancelledMessage)
                .font(.headline)
                .padding(.vertical)
            
            Button{
                guard let user = viewModel.currentUser else {return}
                guard let trip = viewModel.trip else {return}
                
                if user.accountType == .passenger {
                    if trip.state == .driverCancelled {
                        viewModel.deleteTrip()
                    } else if trip.state == .passengetCancelled {
                        viewModel.trip = nil
                    }
                } else {
                    if trip.state == .passengetCancelled {
                        viewModel.deleteTrip()
                    } else if trip.state == .driverCancelled {
                        viewModel.trip = nil
                    }
                }
            } label: {
                Text("OK")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(width: UIScreen.main.bounds.width - 32, height: 50).background(.blue).cornerRadius(10).foregroundColor(.white)
            }
        }
        .padding(.bottom,24)
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor,radius: 20)
    }
}

#Preview {
    TripCancelledView()
}
