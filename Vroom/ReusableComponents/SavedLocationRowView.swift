//
//  SavedLocationRowView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/12/23.
//

import SwiftUI

struct SavedLocationRowView: View {
    let viewModel:SavedLocationViewModel
    let user: User
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: viewModel.imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(viewModel.iconColor)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.title)
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(Color.theme.primaryTextColor)
                
                Text(viewModel.subtitle(forUser: user))
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
        }
    }
}

//#Preview {
//    SavedLocationRowView(viewModel: .home, user: User(fullName: "John Doe", email: , uid: ))
//}

