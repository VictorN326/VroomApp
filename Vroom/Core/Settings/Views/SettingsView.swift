//
//  SettingsView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/12/23.
//

import SwiftUI

struct SettingsView: View {
    private let user: User
    @EnvironmentObject var viewModel: AuthenticationViewModel
    init(user: User) {
        self.user = user
    }
    var body: some View {
        VStack {
            List {
                Section {
                    // user information header
                    HStack {
                        Image("ElonMusk").resizable().scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 64, height: 64)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(user.fullName).font(.system(size: 16, weight: .semibold))
                            Text(user.email).accentColor(Color.theme.primaryTextColor)
                                .opacity(0.77).font(.system(size: 14))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .imageScale(.small)
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                    }
                    .padding(8)
                }
                
                Section("Favorites") {
                    ForEach(SavedLocationViewModel.allCases) {location in
                        NavigationLink(destination: {
                            SavedLocationSearchView(config: location)
                        }, label: {
                            SavedLocationRowView(viewModel: location, user: user)
                        })
                    }
                }
                Section("Settings") {
                    SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", iconColor: Color(.systemPurple))
                    SettingsRowView(imageName: "creditcard.circle.fill", title: "Payment Methods", iconColor: Color(.systemMint))
                }
                Section("Account") {
                    SettingsRowView(imageName: "dollarsign.circle.fill", title: "Make Money Driving", iconColor: Color(.systemGreen))
                    SettingsRowView(imageName: "arrow.left.square.fill", title: "Sign Out", iconColor: Color(.systemRed))
                        .onTapGesture {
                            viewModel.signOut()
                        }
                }
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.large)
    }
}

// have to do old ways of preview to use dummy data from DeveloperPreview file
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SideMenuView(user: dev.mockUser)
        }
    }
}
