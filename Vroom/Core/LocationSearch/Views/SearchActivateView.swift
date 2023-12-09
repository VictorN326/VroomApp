//
//  SearchActivateView.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/28/23.
//

import SwiftUI

struct SearchActivateView: View {
    var body: some View {
        HStack {
            Rectangle().fill(Color.black).frame(width: 8, height: 8)
                .padding(.horizontal)
            Text("Where to?").foregroundStyle(Color(.darkGray))
            
            Spacer()
            
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50).background(Rectangle().fill(Color.white).shadow(color: .black, radius: 6))
    }
}

#Preview {
    SearchActivateView()
}
