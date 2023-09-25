//
//  MapView.swift
//  Airlines
//
//  Created by Safrana on 9/22/23.
//

import SwiftUI
import MapKit


struct MapView: UIViewRepresentable {
//    @Binding var latitude: Double
//    @Binding var longitude: Double
    
    var latitude: Double
    var longitude: Double

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        uiView.setRegion(region, animated: true)

        // Add a pin at the live location
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        uiView.removeAnnotations(uiView.annotations)
        uiView.addAnnotation(annotation)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }

    }
}


//    struct MapView_Previews: PreviewProvider {
//        @State private var latitude: Double = 37.7749 // Initial latitude
//        @State private var longitude: Double = -122.4194 // Initial longitude
//
//        static var previews: some View {
//            MapView(latitude:$latitude, longitude: $longitude)
//                            .edgesIgnoringSafeArea(.all)
//        }
//    }
