//
//  LoadingView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/13/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Capsule().foregroundColor(Color(.systemGray5))
                .frame(width: 48, height: 6)
                .padding(.top, 8)
            HStack {
                Text("Connecting you to a driver...")
                    .font(.headline)
                    .padding()
                Spacer()
                Spinner(lineWidth: 6, height: 64, width: 64).padding()
            }
            .padding(.bottom, 24)
        }
        .background(Color.theme.backgroundColor)
        .cornerRadius(16)
        .shadow(color: Color.theme.secondaryBackgroundColor,radius: 20)
    }
}

#Preview {
    LoadingView()
}
