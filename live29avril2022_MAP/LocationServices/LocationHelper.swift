//
//  LocationHelper.swift
//  live29avril2022_MAP
//
//  Created by Lunack on 29/04/2022.
//

import Foundation
import SwiftUI
import MapKit


class LocationHelper: NSObject, ObservableObject, CLLocationManagerDelegate, Identifiable {
    
    @Published var coordinates: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.8588897, longitude: 2.320041),
        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    
    var manager = CLLocationManager()
    
    var lastLocation: CLLocation?
    var span: MKCoordinateSpan
    
    init(_ location: CLLocation){
        span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        coordinates = MKCoordinateRegion(center: location.coordinate, span: span)
        super.init()
        manager.delegate = self
        start()
    }
    
    func start() {
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    // 3 méthodes à implémenter pour la gestion du gps
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .authorizedAlways: print("toujours autoriser")
        case .authorizedWhenInUse: print("seulement authorisée quand l'application fonctionne")
        case .denied: print("je n'autorise pas la localisation")
        case .notDetermined: print("Localisation non déterminée")
        case .restricted: print("Vous n'avez pas autorisé l'application à accéder à votre localisation. Allez dans réglages pour activer votre position.")
            @unknown default: break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        if let lastLocation = locations.last {
            withAnimation {
                recentrer(newLocation: lastLocation)
            }
        }
    }
    
    func recentrer(newLocation : CLLocation) {
        lastLocation = newLocation
        coordinates = MKCoordinateRegion(
            center: newLocation.coordinate,
            span: span)
    }
}
