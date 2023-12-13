//
//  SavedLocationSearchView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/12/23.
//

import SwiftUI

struct SavedLocationSearchView: View {
    @State private var text = ""
    @StateObject var viewModel = SearchViewModel()
    let config : SavedLocationViewModel
 
    var body: some View {
        VStack {
            TextField("Searching for a location...", text: $viewModel.queryFragment)
                .frame(height: 32)
                .padding(.leading)
                .background(Color(.systemGray5))
                .padding()
            
            Spacer()
            
            LocationSearchResults(viewModel: viewModel, config: .saveLocation(config))
        
        }
        .navigationTitle(config.subtitle)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        SavedLocationSearchView(config: .home)
    }
}
