//
//  SettingsRowView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/12/23.
//

import SwiftUI

struct SettingsRowView: View {
    let imageName: String
    let title: String
    let iconColor: Color
    var body: some View {
        HStack(spacing: 12){
            Image(systemName: imageName)
                .imageScale(.medium)
                .font(.title)
                .foregroundColor(iconColor)
            
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(Color.theme.primaryTextColor)
            
        }
        .padding(4)
    }
}

#Preview {
    SettingsRowView(imageName: "bell.circle.fill", title: "Notifications", iconColor: Color(.systemPurple))
}
