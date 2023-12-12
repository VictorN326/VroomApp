//
//  RideRequest.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/10/23.
//

import SwiftUI

struct RideRequest: View {
    @State private var selectedRideType : RideType = .VroomX
    @EnvironmentObject var locationViewModel : SearchViewModel
    var body: some View {
        VStack {
            Capsule().foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            
        // Our Trip Info View
            HStack {
                VStack {
                    Circle().fill(Color.theme.primaryTextColor)
                        .frame(width: 8, height: 8)
                    Rectangle().fill(Color.theme.primaryTextColor)
                        .frame(width: 1, height: 32)
                    Rectangle().fill(Color.theme.primaryTextColor)
                        .frame(width: 8, height: 8)
                }
                VStack(alignment: .leading, spacing: 24) {
                    HStack {
                        Text("Current Location").font(.system(size: 16, weight: .semibold)).foregroundColor(.gray)
                        Spacer()
                        Text(locationViewModel.pickupTime ?? "").font(.system(size: 14, weight: .semibold)).foregroundColor(.gray)
                    }
                    .padding(.bottom, 10)
                    
                    HStack {
                        if let location = locationViewModel.selectedVroomLocation {
                            Text(location.title).font(.system(size: 16, weight: .semibold))
                        }
                        Spacer()
                        Text(locationViewModel.dropOffTime ?? "").font(.system(size: 14, weight: .semibold)).foregroundColor(.gray)
                    }
                }
                .padding(.leading, 8)
            }
            .padding()
            
            Divider()
        // Our Ride Type Selection
            Text("SUGGESTED RIDES").font(.subheadline).fontWeight(.semibold).padding().foregroundColor(.gray)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            ScrollView(.horizontal) {
                HStack(spacing: 12) {
//                    ForEach(RideType.allCases) {type in
//                        VStack(alignment: .leading) {
//                            Image(type.imageName).resizable().scaledToFit()
//                            VStack(alignment: .leading, spacing: 4){
//                                Text(type.description).font(.system(size: 14, weight: .semibold))
//                                Text("$22.04").font(.system(size: 14, weight: .semibold))
//                            }.padding()
//                        }
//                        .frame(width: 112, height: 140).foregroundColor(type == selectedRideType ? .white : .black)
//                        .background(Color(type == selectedRideType ? .systemBlue : .systemGroupedBackground ))
//                        .scaleEffect(type == selectedRideType ? 1.2 : 1.0)
//                        .cornerRadius(10).onTapGesture {
//                            withAnimation(.spring()) {
//                                selectedRideType = type
//                            }
//                        }
//                    }
                    ForEach(RideType.allCases) { type in
                        VStack(alignment: .leading) {
                   
                            if type == .VroomXL {
                                Image(type.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                            } else {
                                Image(type.imageName)
                                    .resizable()
                                    .scaledToFit()
                            }
                            VStack(alignment: .leading, spacing: type == .VroomXL ? 2 : 4) {
                                Text(type.description).font(.system(size: 14, weight: .semibold))
                                Text(locationViewModel.computeRidePrice(forType: type).toCurrency()).font(.system(size: 14, weight: .semibold))
                            }.padding(.horizontal)
                            
            
                        }
                        .frame(width: 112, height: 140)
                        .foregroundColor(type == selectedRideType ? .white : Color.theme.primaryTextColor)
                        .background(type == selectedRideType ? .blue : Color.theme.secondaryBackgroundColor)
                        .scaleEffect(type == selectedRideType ? 1.2 : 1.0)
                        .cornerRadius(10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                selectedRideType = type
                            }
                        }
                    }

                }
            }
            .padding(.horizontal)
            
            Divider().padding(.vertical, 8)
        // Payment Option Selection
            
            HStack(spacing: 12) {
                Text("Visa").font(.subheadline).fontWeight(.semibold).padding(6).background(.blue).cornerRadius(4).foregroundColor(.white).padding(.leading)
                Text("**** 1234").fontWeight(.bold)
                Spacer()
                Image(systemName: "chevron.right").imageScale(.medium).padding()
            }
            .frame(height: 50)
            .background(Color.theme.secondaryBackgroundColor).cornerRadius(10)
            .padding(.horizontal)
            
        // Requesting Ride Button
            Button{
                
            } label: {
                Text("CONFIRM RIDE")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).frame(width: UIScreen.main.bounds.width - 32, height: 50).background(.blue).cornerRadius(10).foregroundColor(.white)
            }
                
        }
        .padding(.bottom, 24)
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
    }
}

#Preview {
    RideRequest()
}
