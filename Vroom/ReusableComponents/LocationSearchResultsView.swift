//
//  LocationSearchResultsView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/12/23.
//

import SwiftUI

struct LocationSearchResults: View {
    @StateObject var viewModel: SearchViewModel
    let config: LocationResultsViewConfiguration
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                ForEach(viewModel.results, id: \.self)
                {result in SearchResultCells(title: result.title, subtitle: result.subtitle)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                viewModel.selectLocation(result, config: config)
                                dismiss()
                                
                            }
                        }
                }
            }
        }
    }
}

