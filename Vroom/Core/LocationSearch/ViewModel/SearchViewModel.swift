//
//  SearchViewModel.swift
//  Vroom
//
//  Created by Victor Nguyen on 11/27/23.
//

import Foundation
import MapKit

class SearchViewModel: NSObject, ObservableObject {
    // Published means when it gets published, it sends notification to views listening for changes on it
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedLocation : String?
    
    private let searchCompleter = MKLocalSearchCompleter()
    
    var queryFragment: String = "" {
        didSet {
//            print("DEBUG, Query Fragment is \(queryFragment)")
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    override init() {
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    func selectLocation(_ location: String) {
        self.selectedLocation = location
        print("DEBUG: Selected Location is \(self.selectedLocation)")
    }
}


extension SearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
