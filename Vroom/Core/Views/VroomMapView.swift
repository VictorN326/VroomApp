//
//  VroomMapView.swift
//  Vroom
//
//  Created by Victor Nguyen on 12/7/23.
//

import Foundation
import SwiftUI
import MapKit
struct VroomMapView: UIViewRepresentable {
    
    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    // make the mapView we see in app
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false;
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension VroomMapView {
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: VroomMapView
        
        init(parent: VroomMapView) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            parent.mapView.setRegion(region, animated: true)
        }
    }
}
