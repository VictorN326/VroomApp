//
//  SideMenuView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/12/23.
//

import SwiftUI

struct SideMenuView: View {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    var body: some View {
            VStack(spacing: 40) {
                 // header
                VStack(alignment: .leading,spacing: 32) {
                    // user info (email and name)
                    HStack {
                        Image("ElonMusk").resizable().scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(user.fullName).font(.system(size: 16, weight: .semibold))
                            Text(user.email).accentColor(Color.theme.primaryTextColor)
                                .opacity(0.77).font(.system(size: 14))
                        }
                        
                    }
                    //becoming a driver functionality
                    VStack(alignment: .leading,spacing: 16) {
                        Text("Do more with your account").font(.footnote)
                            .fontWeight(.semibold)
                        HStack{
                            Image(systemName: "dollarsign.square")
                                .font(.title2).imageScale(.medium)
                            Text("Make Money Driving")
                                .font(.system(size: 16, weight: .semibold))
                                .padding(6)
                        }
                    }
                    Rectangle().frame(width: 296, height: 0.75).opacity(0.7)
                        .foregroundColor(Color(.separator))
                        .shadow(color: .black.opacity(0.7),radius: 4)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading, 16)
                
                // our option list
                
                VStack {
                    ForEach(SideMenuOptionModel.allCases) {optionItem in
                        
                        NavigationLink(value: optionItem) {
                            SideMenuOptionView(viewModel: optionItem)
                                .padding()
                        }
                    }
                }
                .navigationDestination(for: SideMenuOptionModel.self) { optionItem in
                    Text(optionItem.title)
                }
                Spacer()
                
            }
            .padding(.top, 32)
            
        
    }
}

#Preview {
    SideMenuView(user: User(fullName: "John Doe", email: "johndoe@gmail.com", uid: "1234566"))
}
