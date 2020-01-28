//
//  MapView.swift
//  TestMap2
//
//  Created by Исмаил Хасбулатов on 29.01.2020.
//  Copyright © 2020 Organization Name. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    @Binding var centerCoordinator: CLLocationCoordinate2D
    
    func makeCoordinator() -> MapView.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        print("updating view")
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        init(_ parent: MapView) {
            self.parent = parent
        }
    
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print("map center = ", mapView.centerCoordinate)
            parent.centerCoordinator = mapView.centerCoordinate
        }
        
        func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
            let dortmundLocation = CLLocation(latitude: 55.771297, longitude: 37.622342)
            let dortmunRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: dortmundLocation.coordinate.latitude, longitude: dortmundLocation.coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(dortmunRegion, animated: true)
        }
    }
}

extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "Moscow"
        annotation.subtitle = "OnLife"
        annotation.coordinate = CLLocationCoordinate2D(latitude: 55.4507, longitude: 37.3656)
        return annotation
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinator: .constant(MKPointAnnotation.example.coordinate))
    }
}
