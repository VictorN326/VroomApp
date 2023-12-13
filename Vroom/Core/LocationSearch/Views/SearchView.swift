//
//  SearchView.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/28/23.
//

import SwiftUI

struct SearchView: View {
    @State private var startLocationText = ""
    @EnvironmentObject var viewModel : SearchViewModel
    
    
    var body: some View {
        VStack {
            // Our Location Header View (current location and final destination)
            HStack {
                VStack {
                    Circle().fill(Color.theme.primaryTextColor)
                        .frame(width: 6, height: 6)
                    Rectangle().fill(Color.theme.primaryTextColor)
                        .frame(width: 1, height: 24)
                    Rectangle().fill(Color.theme.primaryTextColor)
                        .frame(width: 6, height: 6)
                }
                VStack {
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    TextField("Where to?", text: $viewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            Divider().padding(.vertical)
            // Our Location List View (view the list of deired locations)
            LocationSearchResults(viewModel: viewModel, config: .ride)
        }
        .background(Color.theme.backgroundColor)
        .background(.white)
    }
}

#Preview {
    SearchView()
}

